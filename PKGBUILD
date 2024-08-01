# Maintainer: Zhijun Zhang <zhangzhijun23@mails.ucas.ac.cn>

pkgname=ds9-git
pkgver=v8.6
pkgrel=1
pkgdesc="SAOImage DS9: Astronomical Data Visualization Application"
url="https://github.com/SAOImageDS9/SAOImageDS9.git"
arch=('x86_64')
license=('GPL3')
depends=(libx11 zlib libxslt libxml2 libxft tcl tk)
options=(!strip !lto)
makedepends=(git gcc make automake autoconf zip)
conflicts=('ds9' 'ds9-bin')
source=($pkgname::git+$url
        "SAOImageDS9.desktop"
        "SAOImageDS9.svg")
sha256sums=('SKIP'
         '568a1c327560a1fd0a4e1f0b631582f7ed421332ab6aa3336f2832347541f693'
         'a9940c6d6d1ffd59a019518b803a2ac574e4aff0bf7503e4f4d61648c46b3c69')

pkgver() {
  cd "$pkgname"
  git describe --tags
}

build() {
    cd ${srcdir}/${pkgname}
    unix/configure
    make
}

package() {
    install -Dm644 SAOImageDS9.desktop ${pkgdir}/usr/share/applications/SAOImageDS9.desktop
    install -Dm644 SAOImageDS9.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/SAOImageDS9.svg

    cd ${srcdir}/${pkgname}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 ./bin/ds9 ${pkgdir}/usr/bin/ds9
}
