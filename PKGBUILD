# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Nils Werner <nils DOT werner AT gmail DOT com>
pkgname='essentia-acousticbrainz'
_pkgname='essentia'
_python=python2
# only change when acousticbrainz provided binaries also change !
_AB_COMMIT=21ef5f41f15ed1f80c8f9b36802430055d3b93e9

pkgver=2.1_beta1.r28.g21ef5f4
pkgrel=1
pkgdesc="audio analysis and audio-based music information retrieval for acousticbrainz"
url="http://essentia.upf.edu/"
arch=('x86_64' 'i686')
license=('AGPL')
makedepends=('python2' 'git')
depends=('libyaml' 'fftw' 'ffmpeg' 'taglib' 'libsamplerate')
source=("git+https://github.com/MTG/$_pkgname.git#commit=$_AB_COMMIT")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/\./g'
}

build() {
    cd "$srcdir/$_pkgname"
    $_python waf configure \
	    --mode=release --prefix=/usr/ \
	    --with-example=streaming_extractor_music
    $_python waf --prefix=/usr/
}

package() {
    cd "$srcdir/$_pkgname"
    install -D build/src/examples/streaming_extractor_music \
	    $pkgdir/usr/bin/streaming_extractor_music
}
