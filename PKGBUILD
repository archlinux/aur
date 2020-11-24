# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=emptty
pkgdesc="Dead simple CLI Display Manager on TTY"
pkgver=0.3.0
pkgrel=1
arch=('x86_64')
url="https://github.com/tvrzna/emptty"
license=('MIT')
depends=('pam')
makedepends=('go' 'libx11')
optdepends=('xorg-server: default display server'
            'xorg-xauth: required if using xorg-server'
            'util-linux: mcookie required if using xorg-server'
            'wayland: alternative to xorg-server')
backup=('etc/emptty/conf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1f9be379a76e95f7965ae3853cd322d73f8c575182850e1886ae21817f6741393db0a2e36ed4995f6a9291cee1c4efa34db08557d81aefc703e7099964dc33bb')

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install-all
  make DESTDIR="$pkgdir/" install-config
  make DESTDIR="$pkgdir/" install-systemd
  echo "Disable your DM and run 'systemctl enable emptty' to enable emptty at the next boot"
}
