# Contributor: Shaber
# Maintainer: Dan Johansen <strit@manjaro.org>

pkgname=corepdf
pkgver=2.7.0
pkgrel=2
pkgdesc="A PDF viewer from the CoreApps family."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/$pkgname"
license=('GPL3')
depends=('qt5-base' 'poppler-qt5' 'libcprime')
groups=('coreapps')
source=("https://gitlab.com/cubocore/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'corepdf.desktop'
        'corepdf.svg')
md5sums=('f081935f61c62381f23daf30b7a198b4'
         'a41a609862a5713ba152474837e3187e'
         '8c67a9f44d0f7078ed023de96d26adab')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
  install -Dm644 "../corepdf.desktop" -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "../corepdf.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
}
