# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=yubioath-desktop
pkgdesc='Yubico Authenticator for Desktop'
pkgver=5.0.0
pkgrel=1
arch=('x86_64')
url='https://github.com/Yubico/yubioath-desktop'
license=('BSD2' 'custom')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2'
         'python-pyotherside')
makedepends=('python')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('10d1e0daf374b825ca8db3facbf7007815ebc411c24e1d9e1bbb3353d8e87fac4f6be44769c823c8ab11e2178dca3db39c639dc703d7726f91dc7019c2b4f142')

build() {
  cd $pkgname-$pkgname-$pkgver

  qmake . \
    PREFIX='/usr' \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"

  make
}

package() {
    cd $pkgname-$pkgname-$pkgver

    make INSTALL_ROOT="$pkgdir" install

    install -Dm 644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm 644 images/yubioath@2x.png "$pkgdir"/usr/share/licenses/$pkgname/yubioauth.png
    install -Dm 755 resources/yubioath-desktop.desktop "$pkgdir"/usr/share/applications/yubioath-desktop.desktop
}

