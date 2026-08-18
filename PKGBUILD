# Maintainer: Mr. Tao <tao@post.cz>

pkgname=cdwifi-autoaccept
pkgver=0.1.0
pkgrel=1
pkgdesc='Guarded automatic acceptance for the CDWiFi captive portal'
url='https://github.com/Mr-Tao/cdwifi-autoaccept'
arch=('any')
license=('Apache-2.0')

depends=(
  'bash'
  'curl>=8.4'
  'grep'
  'networkmanager>=1.16'
  'python>=3.11'
  'systemd>=247'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4df62a258d1ba29145f972307c9e9b8eabe416119b3378573877e6618d6219d')

check() {
  cd "$pkgname-$pkgver"
  PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s tests -v
}

package() {
  cd "$pkgname-$pkgver"
  python3 packaging/stage.py --destdir "$pkgdir"
}
