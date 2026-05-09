# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: hrdl <aur@hrdl.eu>

pkgname=python-wyoming-faster-whisper
_pkgname=wyoming-faster-whisper
pkgdesc="Wyoming Server for Faster Whisper"
pkgver=3.1.0
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming-faster-whisper"
license=('MIT')
depends=(python 'python-wyoming>=1.8' 'python-faster-whisper>=1.2.1')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/rhasspy/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        wyoming-faster-whisper.conf
        wyoming-faster-whisper.service)
sha256sums=('f0b6ef1ae782c1108f7bc2307d223d11853af7576e835ee7a13785318f4cc7fe'
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
