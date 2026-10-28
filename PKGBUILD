# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=ceviribro
pkgver=3.0.0
pkgrel=1
pkgdesc='Keyboard-first terminal translator powered by DeepL'
arch=('any')
url='https://github.com/talhacaglar/ceviribro'
license=('MIT')
depends=('python' 'python-textual' 'python-deepl' 'python-pyperclip' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
provides=('tui-translator')
conflicts=('tui-translator')
replaces=('tui-translator')
optdepends=('wl-clipboard: clipboard support on Wayland'
            'xclip: clipboard support on X11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94c9a7a69587fc7f848dabde3ddc2a49c84ab5c74002190da0ad5086887be2f1')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python -m unittest discover -s tests
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
