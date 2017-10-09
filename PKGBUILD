pkgname=spotify-ripper-git
pkgver=r451.d046419
pkgrel=1
pkgdesc='Command-line ripper for Spotify, with a workaround for playlist emptying'
arch=('any')
url="https://github.com/hbashton/spotify-ripper"
license=('MIT')
depends=('python2' 'python2-pyspotify=2.0.5' 'python2-colorama-0.3.3' 'python2-mutagen' 'python2-requests>=2.3.0' 'python2-schedule>=0.3.1')
optdepends=('lame: Rip songs to mp3' 'flac: Rip songs to lossless FLAC encoding' 'opus-tools: Rip songs to Opus encoding' 'vorbis-tools: Rip songs to Ogg Vorbis encoding' 'faac: Rip songs to AAC format with FreeAAC' 'libav-git-no-libs: Rip songs to Apple Lossless format' 'fdkaac: Rip songs to MP4/M4A format with Fraunhofer FDK AAC codec')
makedepends=('python2-setuptools' 'git')
source=("git+https://github.com/hbashton/spotify-ripper")
sha256sums=('SKIP')
_name=spotify-ripper

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$_name"
	ls
	sed -i 's/mutagen==/mutagen>=/' setup.py
	python2 setup.py install --root="$pkgdir"
}
