# Maintainer: PumpkinCheshire <sollyonzou at gmail dot com>

pkgname=bwa-git
pkgver=v0.7.17.r23.gfbfffc9
pkgrel=2
pkgdesc="Burrows-Wheeler Aligner maps low-divergent sequences against a large reference genome"
arch=('x86_64')
url="http://bio-bwa.sourceforge.net/"
license=('GPL3')
depends=('perl' 'zlib')
makedepends=('git' 'make')
source=('git+https://github.com/lh3/bwa.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    git -C ${pkgname%-git} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" ${srcdir}/${pkgname%-git}/bwa
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" ${pkgname%-git}/COPYING
}
