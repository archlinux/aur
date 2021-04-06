# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=minitube
pkgver=3.8.2
pkgrel=1
pkgdesc="A YouTube desktop application"
arch=('x86_64')
url="https://flavio.tordini.org/minitube"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-declarative' 'qt5-x11extras')
makedepends=('mpv' 'qt5-tools')
source=("https://github.com/flaviotordini/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('83910647e820560fab64e1b242df6aa19239d2aa6510b7bfee6e0c6bc319378d5a76b97e48adabcb9318258e523c1c1b1c2a178b7055d4466f43ddbf0e7d8522')
b2sums=('a88d0876c6a97960d54a9b4168828dda0aca1114f3e6a292239775c56313dc60908811f4af752b36f4a9b83cb653e4c85acbc63384331468efd5d1c5926a1364')

build() {
  cd "${pkgname}-${pkgver}"
  qmake
}

package() {
  depends+=('libmpv.so')

  cd "${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}/"
  install -vDm 644 {AUTHORS,CHANGES,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
