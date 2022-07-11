# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=nedit
pkgver=5.7
pkgrel=4
pkgdesc="A Unix text editor for programmers and general users"
arch=('x86_64')
url="https://sourceforge.net/projects/${pkgname}"
license=('GPL')
depends=('openmotif')
makedepends=('pod2man')
options=('!makeflags')
source=(${url}/files/${pkgname}-source/${pkgname}-${pkgver}-src.tar.gz
  ${pkgname}.desktop)
sha512sums=('cf242d2f8eea4c78649dbeb741f545a3dc8ffaf5bb36239794a4b2635420e5445fa1c77472add79c05ec081d71a0b9df4431f48db365a71692e43869fd4e7932'
  'c0f5390ffe7aa58940ee4beffdc9d568d46de8c191e71aae1051586eadf179313f80d9a7b760bb9678ee3a4ead099d52c896e9b0c90d05991b26cd8fb404dae4')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|"/bin/csh"|"/bin/sh"|' source/preferences.c
}

build() {
  cd ${pkgname}-${pkgver}
  make CFLAGS+="${CFLAGS} -DBUILD_UNTESTED_NEDIT" linux docs
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 source/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 source/nc "${pkgdir}/usr/bin/${pkgname}-client"
  install -Dm644 doc/${pkgname}.man "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 doc/nc.man "${pkgdir}/usr/share/man/man1/${pkgname}-client.1"
  install -Dm644 doc/${pkgname}.html "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.html"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
