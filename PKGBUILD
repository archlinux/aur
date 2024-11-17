# Maintainer: hrdl <aur@hrdl.eu>

pkgname=python-wyoming-faster-whisper
_pkgname=wyoming-faster-whisper
pkgdesc="Wyoming Server for Faster Whisper"
pkgver=2.2.0
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming-faster-whisper"
license=('MIT')
depends=(python 'python-wyoming>=1.5.2' 'python-faster-whisper>=1.0.3')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/rhasspy/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        wyoming-faster-whisper.conf
        wyoming-faster-whisper.service)
sha256sums=('dfad4161daecd04bcf48d8815426e94c3c7a29a2ce700ef62c3f0be59bc79994'
            '9b4a794ebcfbed17849adae53ce5a70ca354d8522693ca721a3938aad150a97d'
            'e765dd8deb74decd04fe9f5a512f80007c4d49c83a066e69ca9c2adcf468bc82')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../wyoming-faster-whisper.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 ../wyoming-faster-whisper.conf "$pkgdir/etc/conf.d/wyoming-faster-whisper"
}
