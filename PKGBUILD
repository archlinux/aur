# Maintainer: gilcu3

_pkgname=wyoming-openwakeword
pkgname=python-$_pkgname
pkgdesc="Wyoming Server for OpenWakeWord"
pkgver=2.1.0
pkgrel=2
arch=(any)
url="https://github.com/rhasspy/wyoming-openwakeword"
license=('Apache-2.0')
depends=(python 'python-wyoming>=1.8' python-pyopen-wakeword)
optdepends=('python-zeroconf: zeroconf discovery (--zeroconf)')
makedepends=('python-build' 'python-installer' 'python-setuptools')
backup=(etc/conf.d/wyoming-openwakeword)

source=($_pkgname-$pkgver.tar.gz::https://github.com/rhasspy/$_pkgname/archive/refs/tags/v$pkgver.tar.gz
        wyoming-openwakeword.conf
        wyoming-openwakeword.service)
sha256sums=('b8ccb3666d31bd55c6e8850bd60ac82225780570b11898354f48fc17f29c06a8'
            '3299be34ad2a9251d3befa2a8dc17635337fc45173e034ff43739a4092800cbd'
            '57d01d756ad880bc6bb16facc3dd78b42fd3e0413951bcb3efc7068772be4377')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../wyoming-openwakeword.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ../wyoming-openwakeword.conf "$pkgdir/etc/conf.d/wyoming-openwakeword"
}
