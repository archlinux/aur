# Maintainer: desbma
# Contributor: after
pkgname=bpm-tools
pkgver=0.3
pkgrel=2
pkgdesc='Tools to calculate tempo of audio tracks, display graphs and tag files with bpm value'
arch=('i686' 'x86_64')
url="http://www.pogo.org.uk/~mark/${pkgname}/"
license=('GPL2')
depends=('sox')
optdepends=('gnuplot: for bpm-graph usage'
            'flac: FLAC tagging support for bpm-tag'
            'vorbis-tools: Vorbis tagging support for bpm-tag'
            'id3v2: MP3 tagging support for bpm-tag')
source=("http://www.pogo.org.uk/~mark/${pkgname}/releases/${pkgname}-${pkgver}.tar.gz"
        'fix-bpm-graph-man.patch'
        'fix-bpm-tag-id3v2.patch')
sha512sums=('7d01bea3689b7ed57063620d71a4a70709d64abddfeddde851da90b4ae585427fd7fcc41b46a3677ef9c6ad7109c58523696cf2f3d4a5c0198727e6428a9fc10'
            'd43fa663366a1e3254bb4d20918d61676971562525945083183af3ebf27551f550efe63e2d79f4f9649e98db8a422552db5c529bdb29865ab3827312d88408bf'
            '0e4f2adaeb3ed306c6df8260e3c6e7a9f566723af9a6d8e96a6fd586db54c88426eb157f7d98e7045e0f8931576bcd3afebe16391199009f4757997a88e0fa05')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -i "${srcdir}/fix-bpm-graph-man.patch" bpm-graph.1
    patch -i "${srcdir}/fix-bpm-tag-id3v2.patch" bpm-tag
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make install PREFIX=/usr DESTDIR="${pkgdir}"
}
