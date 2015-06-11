# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xasteroids
pkgver=5
pkgrel=1
pkgdesc="Classical asteroids game for X11"
arch=('i686' 'x86_64')
url="http://packages.debian.org/en/source/squeeze/xasteroids"
license=('custom')
depends=('libx11')
source=("http://www.ibiblio.org/pub/Linux/games/arcade/asteroids/${pkgname}.tgz"
        "01_legacy.patch"
        "02_xast.patch"
        "COPYING")
md5sums=('71a7a4c0abc9e9fec646e9c8f2433d79'
         'ddadc870143e131dcdcc994b15519432'
         '828d50583f394807a58ff8434b4eacb3'
         'c3358fb85f157269c78e689ec71e8da3')

build() {
  cd "${srcdir}/${pkgname}"
  patch -p1 -i ../01_legacy.patch
  patch -p0 -i ../02_xast.patch
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 xast "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 xast.man "${pkgdir}/usr/share/man/man6/${pkgname}.6"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
