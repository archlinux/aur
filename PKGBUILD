pkgname=python-wyoming-piper
_pkgname=wyoming_piper
pkgdesc="Wyoming Server for Piper"
pkgver=1.1.0
pkgrel=1
arch=(any)
url="http://github.com/rhasspy/rhasspy3"
license=('MIT')
depends=(python python-wyoming piper-tts)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=(etc/conf.d/wyoming-piper)
source=("https://files.pythonhosted.org/packages/source/w/$_pkgname/$_pkgname-$pkgver.tar.gz"
        wyoming-piper.conf
        wyoming-piper.service)
sha256sums=('a1eeb64e7f55b6fc92587e000f23ea935b34e6b764d261c15ff49a3a74c14eef'
            '43bc755507af4b46efaacb8d408470ab8fa0f3423a84cf9cc31237b679a7bf73'
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
}
