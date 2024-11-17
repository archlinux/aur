pkgname=python-wyoming-piper
_pkgname=wyoming-piper
pkgdesc="Wyoming Server for Piper"
pkgver=1.5.2
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming-piper"
license=('MIT')
depends=(python python-wyoming piper-tts)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=(etc/conf.d/wyoming-piper)
source=("git+https://github.com/rhasspy/wyoming-piper.git#tag=v${pkgver}"
        wyoming-piper.conf
        wyoming-piper.service)
b2sums=('06df8a4acd0b61173c58b66426e9318ae24672de2bfc17a905235331eeb7bc652742b2388323c93f6df4b1b7cae307aae0c319e5f713e1b9e893f5e9fd54016e'
        'd81867797c195e91d22cf0d8a93d63c07ecfa2f7bffe2fc67ccb00c988e6184deba12317b2cf5f049478fbb884e2f73a42072528629cf903f1bfef8cfcd02ac9'
        '705dc0c29558e10a3d0bc035c1cc5eb913e87c03210c9d3d1f6cc418d2bad03c91ac53b7ed178f07ae8c0bd9054eb84f3848c2232df04cd6890180cfa1c46665')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../wyoming-piper.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ../wyoming-piper.conf "$pkgdir/etc/conf.d/wyoming-piper"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
