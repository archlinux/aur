# Maintainer: Jochem Kuipers <jochem@localhost>
pkgname=flydigi-vader4d
pkgver=0.1.0
pkgrel=1
pkgdesc='Userspace DInput driver for Flydigi Vader 4 Pro'
arch=('any')
url='https://github.com/JochemKuipers/flydigi-spacestation-linux'
license=('MIT')
depends=('python' 'python-evdev' 'systemd')
makedepends=('python' 'git')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/JochemKuipers/flydigi-spacestation-linux/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  ln -sfn "flydigi-spacestation-linux-$pkgver" "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python packaging/stage.py driver --out "$srcdir/stage-driver"
}

package() {
  cp -a "$srcdir/stage-driver/." "$pkgdir/"
}
