# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-async-tkinter-loop
_name=${pkgname#python-}
pkgver=0.9.3
pkgrel=2
pkgdesc="Asynchronous mainloop implementation for tkinter."
arch=('any')
url="https://insolor.github.io/async-tkinter-loop"
license=('MIT')
depends=(
  'python'
  'tk'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'python-customtkinter'
  'python-pytest'
  'xorg-server-xvfb'
)
source=("$_name-$pkgver.tar.gz::https://github.com/insolor/async-tkinter-loop/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('164e57e9438ee61e7d9e5e487b972a93617ee1a552c953f2ecdc5f9c71f938b3')

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=. xvfb-run -a -s "-screen 0 1024x768x24" pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
