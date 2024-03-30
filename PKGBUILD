# Maintainer: Zhijun Zhang <zhangzhijun23@mails.ucas.ac.cn>

pkgname=ds9-git
pkgver=v8.6b1
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
        "ds9.desktop"
        "ds9.png")
sha256sums=('SKIP'
         'cf41109f31b9be057ab04a96613a59a87fb6cb3ed405fa93545f6bfd8fd98975'
         'ff5f38cfdfd59aee262ae3443fddf35d644b8604c9d6ab07eb96a137ee0a0d28')

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
    install -Dm644 ds9.desktop ${pkgdir}/usr/share/applications/ds9.desktop
    install -Dm644 ${srcdir}/${pkgname}/ds9/doc/sun.png ${pkgdir}/usr/share/pixmaps/ds9.png

    cd ${srcdir}/${pkgname}
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm755 ./bin/ds9 ${pkgdir}/usr/bin/ds9

}
