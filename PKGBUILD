pkgname=python-wyoming-piper
_pkgname=wyoming-piper
pkgdesc="Wyoming Server for Piper"
pkgver=1.5.0
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming-piper"
license=('MIT')
depends=(python python-wyoming piper-tts)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=(etc/conf.d/wyoming-piper)
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        wyoming-piper.conf
        wyoming-piper.service)
sha256sums=('7e3c73ba1ee582109c49f55762f9fcf01984bc7918873a6ffe44c62dcc530ec7'
            'dc68021f9b7cb96e85195e9925229cc49954c18917292e3e881f270f5f2623ee'
            '0c8852bb4380ef9b246718de2a5e9a78a9c56cd6598c3f3975c61cfa544a3e52')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../wyoming-piper.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ../wyoming-piper.conf "$pkgdir/etc/conf.d/wyoming-piper"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
