# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor : Andrew Whatson <whatson@gmail.com>

pkgname=shroud
pkgver=0.1.1
pkgrel=2
pkgdesc='A simple command-line secret manager using GNU Guile'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('guile2.0' 'gnupg' 'xclip')
url="https://dthompson.us/projects/shroud.html"
source=("https://files.dthompson.us/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "fix-version-detect.patch")
sha256sums=('9912fc92ae588e1bdb7999daa893aa4b7c3673ea1e0f895799797de11ff483f8'
            '427dc6f5cc4185c2138ba454d7a822d3f99853e0881cfb3361a9ac8588fe9b18')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i ../fix-version-detect.patch
}

build() {
  cd ${pkgname}-${pkgver}
  GUILE=/usr/bin/guile ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
