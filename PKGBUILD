# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3.1 Pro.
pkgname=yandex-music-downloader-gui
pkgver=1.1.1
pkgrel=2
pkgdesc="Простой и красивый загрузчик музыки из Яндекс.Музыки"
arch=('any')
url="https://github.com/atyonekilla/yandex-music-downloader-gui"
license=('MIT')
depends=('python' 'python-yandex-music-api' 'python-mutagen' 'python-pycryptodome' 'python-pillow' 'python-customtkinter' 'python-imageio-ffmpeg' 'python-strenum')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-git')
source=("git+$url.git#tag=v$pkgver"
        "$pkgname.desktop")
sha256sums=('SKIP'
            '1be1896f5e31ddc49c5d586d50666fa003ae750f8cd17e9504305fb2f6a493e5')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
