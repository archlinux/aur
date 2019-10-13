# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=yubioath-desktop
pkgdesc='Yubico Authenticator for Desktop'
pkgver=5.0.0
pkgrel=4
arch=('x86_64')
url='https://github.com/Yubico/yubioath-desktop'
license=('BSD')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2'
         'python-pyotherside' 'qt5-graphicaleffects' 'ccid' 'pcsclite'
         'yubikey-manager')
makedepends=('git' 'python')
source=("git+$url.git#tag=$pkgname-$pkgver?signed")
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3'        # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E')       # Emil Lundberg <emil@yubico.com>
sha512sums=('SKIP')

build() {
  cd $pkgname

  qmake . \
    PREFIX=/usr \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"

  make
}

package() {
    cd $pkgname

    make INSTALL_ROOT="$pkgdir" install

    install -Dm 644 debian/copyright "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm 644 resources/icons/yubioath.svg "$pkgdir"/usr/share/pixmaps/yubioath.svg
    install -Dm 755 resources/yubioath-desktop.desktop "$pkgdir"/usr/share/applications/yubioath-desktop.desktop
}

