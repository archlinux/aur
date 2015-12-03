# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=csdr-git
pkgver=r29.0fd32aa
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio"
arch=('i686' 'x86_64')
url="https://github.com/simonyiszk/csdr"
license=('GPL')
depends=('fftw')
makedepends=('git' 'python2')
optdepends=('rtl-sdr: csdr-fm script' 'mplayer: csdr-fm script' 'python2: csdr-fm script')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/simonyiszk/csdr.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i "s/python/python2/g" csdr-fm
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm 0755 libcsdr.so ${pkgdir}/usr/lib/libcsdr.so
    install -Dm 0755 csdr ${pkgdir}/usr/bin/csdr
    install -Dm 0755 csdr-fm ${pkgdir}/usr/bin/csdr-fm
}
