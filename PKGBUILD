# Contributor: Johannes Dewender arch at JonnyJD dot net
pkgname=('essentia-acousticbrainz' 'lib32-essentia-acousticbrainz')
pkgver=2.1_beta2
pkgrel=1
pkgdesc="audio analysis and audio-based music information retrieval (binary for acousticbrainz)"
url="http://acousticbrainz.org/download"
license=('AGPL')
arch=('x86_64' 'i686')
source=(http://acousticbrainz.org/static/download/essentia-extractor-v${pkgver}-linux-{x86_64,i686}.tar.gz)
sha256sums=('d9902aadac4f442992877945da2a6fe8d6ea6b0de314ca8ac0c28dc5f253f7d8'
	    '46deb0a053b4910c4e68737a7b6556ff5360260c8f86652f91a0130445f5c949')

prepare() {
    cd "$srcdir"
    for _arch in {x86_64,i686}; do
        tar -xf essentia-extractor-v${pkgver}-linux-${_arch}.tar.gz
	mv streaming_extractor_music streaming_extractor_music_${_arch}
    done
}

package_essentia-acousticbrainz() {
    arch=('x86_64' 'i686')
    cd "$srcdir"
    install -D streaming_extractor_music_${CARCH} \
	    $pkgdir/usr/bin/streaming_extractor_music
}

package_lib32-essentia-acousticbrainz() {
    arch=('x86_64')
    provides=($pkgbase=$pkgver)
    conflicts=($pkgbase)
    cd "$srcdir"
    install -D streaming_extractor_music_i686 \
	    $pkgdir/usr/bin/streaming_extractor_music
}
