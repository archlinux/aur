# Maintainer: Joost Bremmer <toost dot b at gmail dot com>

pkgname=timew
pkgver=0.9.5.alpha
pkgrel=1
pkgdesc="Timewarrior is a command line time tracking application"
arch=('i866' 'x86_64')
url="http://taskwarrior.org/docs/timewarrior/"
license=('MIT')
makedepends=('cmake' 'gcc-libs')
install=timew.install

source=("http://taskwarrior.org/download/timew-${pkgver}.tar.gz"
        "timew-refresh-python2.patch")
sha256sums=('883e4e98d455cd3db4cea63772200473dee3b4d1870540de59e157d69f2e8d94'
            'be49866d0998c8a62245c843d3244883aba4256a878ab72e277aef4ca59b2885')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -p1 -i "${srcdir}/timew-refresh-python2.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} VERBOSE=1 install
    chmod 755 "${pkgdir}/usr/share/doc/timew/holidays/refresh"
    ln -sv "/usr/share/doc/timew/holidays/refresh" "${pkgdir}/usr/bin/timew-refresh-holidays"
}
