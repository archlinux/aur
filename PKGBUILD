# Maintainer: Talha Caglar <talhacaglarr@proton.me>
pkgname=tui-translator
pkgver=2.1.0
pkgrel=1
pkgdesc='Keyboard-first terminal translator powered by DeepL'
arch=('any')
url='https://github.com/talhacaglar/tui-translator'
license=('MIT')
depends=('python' 'python-textual' 'python-deepl' 'python-pyperclip' 'python-dotenv')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('wl-clipboard: clipboard support on Wayland'
            'xclip: clipboard support on X11')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bcc08b217dddfec2f8b97c13686b13a14958ec22d85591ae054307b2f80c0c84')

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
