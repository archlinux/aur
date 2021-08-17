# Maintainer: Joaquin "ShyanJMC" Crespo <shyanjmc@artixlinux.org>

pkgname=keepassxc-minimal
pkgver=2.6.6
pkgrel=1
pkgdesc="KeePassXC is a cross-platform community-driven port of the Windows application Keepass Password Safe. "
arch=('x86_64')
url="https://keepassxc.org/"
license=('GPL')
# depends=('')
makedepends=('qt5-base' 'qt5-tools' 'zlib' 'argon2' 'qt5-x11extras' 'qrencode' 'libsodium' 'yubico-c' 'asciidoctor' 'qt5-svg')
source=("https://github.com/keepassxreboot/keepassxc/releases/download/${pkgver}/keepassxc-${pkgver}-src.tar.xz")
sha256sums=('3603b11ac39b289c47fac77fa150e05fd64b393d8cfdf5732dc3ef106650a4e2')


build() {
  cd keepassxc-${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -DWITH_XC_BROWSER=OFF -DWITH_XC_NETWORKING=OFF -DWITH_XC_SSHAGENT=OFF -DWITH_XC_KEESHARE=OFF -DWITH_GUI_TESTS=OFF -DKEEPASSXC_BUILD_TYPE=Release -DKEEPASSXC_DIST_TYPE=Other -DWITH_DEV_BUILD=OFF -DWITH_APP_BUNDLE=OFF -DWITH_XC_YUBIKEY=OFF -DWITH_XC_AUTOTYPE=OFF -DWITH_TESTS=OFF ..
  make
}

package() {
  cd keepassxc-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
