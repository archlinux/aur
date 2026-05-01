# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=nedit
pkgver=5.8
pkgrel=1
pkgdesc="A Unix text editor for programmers and general users"
arch=('x86_64')
url="https://sourceforge.net/projects/${pkgname}"
license=('GPL')
depends=('openmotif')
makedepends=('pod2man')
options=('!makeflags')
source=(${url}/files/${pkgname}-source/${pkgname}-${pkgver}-src.tar.gz
  ${pkgname}.desktop)
sha512sums=('89806dbcce0abdb8bde823d1a140fcfad3aff2012c00f6aad24f6c2ec27db9aabe5fdf87c8508f3596b7df99bf25e5e3cfbbba9290506eca6fabc73c44580144'
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
