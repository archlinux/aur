# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=yubioath-desktop
pkgdesc='Yubico Authenticator for Desktop'
pkgver=5.0.5
pkgrel=1
arch=('x86_64')
url='https://github.com/Yubico/yubioath-desktop'
license=('BSD')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols2'
         'python-pyotherside' 'qt5-graphicaleffects' 'ccid' 'pcsclite'
         'yubikey-manager')
makedepends=('git' 'python')
source=("git+$url.git#tag=$pkgname-$pkgver?signed")
validpgpkeys=('8D0B4EBA9345254BCEC0E843514F078FF4AB24C3'  # Dag Heyman <dag@yubico.com>
              '57A9DEED4C6D962A923BB691816F3ED99921835E'  # Emil Lundberg <emil@yubico.com>
              '9E885C0302F9BB9167529C2D5CBA11E6ADC7BCD1') # Dennis Fokin <dennis.fokin@yubico.com>
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

    install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -Dm 644 resources/icons/com.yubico.yubioath.svg "$pkgdir"/usr/share/pixmaps/com.yubico.yubioath.svg
    install -Dm 755 resources/com.yubico.yubioath.desktop "$pkgdir"/usr/share/applications/com.yubico.yubioath.desktop
    install -Dm 755 resources/com.yubico.yubioath.appdata.xml "$pkgdir"/usr/share/metainfo/com.yubico.yubioath.appdata.xml
}

