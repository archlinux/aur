# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-async-tkinter-loop
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc="Asynchronous mainloop implementation for tkinter."
arch=('any')
url="https://github.com/insolor/async-tkinter-loop"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('customtkinter' 'python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7769d0b85e5d5222fc65cc84ce7606bd0bea81fa1caf3ed7b198932be52573d4')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  PYTHONPATH=./ pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
