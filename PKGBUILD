# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Todd Musall
# Contributor: dront78 (Ivan)
# Contributor: Victor Noel
# Contributor: ngoonee
pkgname=heimdall
pkgver=1.4.2
pkgrel=1
pkgdesc='Tool suite used to flash firmware (aka ROMs) onto Samsung mobile devices'
arch=('x86_64')
url='http://www.glassechidna.com.au/products/heimdall/'
license=('MIT')
depends=('qt5-base')
makedepends=('cmake')
optdepends=('android-udev: Udev rules to connect Android devices to your linux box')
source=("heimdall-${pkgver}.tar.gz::https://github.com/Benjamin-Dobell/Heimdall/archive/v${pkgver}.tar.gz"
        'heimdall.desktop')
sha256sums=('589bef88f2597c8a84fe6fafbe928ddc9687438b5b54edd917d7df48c7e3eff8'
            '439cea1a8976b9b589ffe4030a084243bcc5e937dcb9c571cdb94d3ff08b4fb4')

build() {
  cd Heimdall-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  install -m644 -D heimdall.desktop "$pkgdir/usr/share/applications/heimdall.desktop"

  cd Heimdall-$pkgver

  # Install license file
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install heimdall command line tool
  install -d "$pkgdir"/usr/bin
  install -Dm755 bin/* "$pkgdir"/usr/bin/
  install -Dm644 heimdall/60-heimdall.rules "$pkgdir"/usr/lib/udev/rules.d/60-heimdall.rules
}
