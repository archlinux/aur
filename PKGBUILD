# Maintainer: gilcu3

_pkgname=wyoming-openwakeword
pkgname=python-$_pkgname
pkgdesc="Wyoming Server for OpenWakeWord"
pkgver=1.8.2
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming-openwakeword"
license=('MIT')
depends=(python python-wyoming python-openwakeword python-onnxruntime python-tflite-runtime)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=(https://github.com/rhasspy/$_pkgname/archive/refs/tags/v$pkgver.tar.gz
        wyoming-openwakeword.conf
        wyoming-openwakeword.service)
sha256sums=('0baa6bba5f3aac7b4eb7df0aad941c35fc3352f872356566727c267429f57cc1'
            '522aa6621f5a69eb1e60b0be483859c3611f43fb071c310c3ab4a74a7e0637a7'
            '23b19f25f5d5d5d734f3fbd2fd16a794e907df8ba80d0612debe0c45515343b5')

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
