pkgname=python-wyoming-piper
_pkgname=wyoming_piper
pkgdesc="Wyoming Server for Piper"
pkgver=0.0.3
pkgrel=2
arch=(any)
url="http://github.com/rhasspy/rhasspy3"
license=('MIT')
depends=(python python-wyoming piper-tts)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=(etc/conf.d/wyoming-piper)
source=("https://files.pythonhosted.org/packages/source/w/$_pkgname/$_pkgname-$pkgver.tar.gz"
        wyoming-piper.conf
        wyoming-piper.service)
sha256sums=('be5ecb8d6ff61c1c7aa3ffafa5aa7ec121b75d7cc3c0569c36671b794ffc6ceb'
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
