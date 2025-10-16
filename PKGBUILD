# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-async-tkinter-loop
_name=${pkgname#python-}
pkgver=0.10.2
pkgrel=1
epoch=1
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
  'python-pytest-timeout'
  'xorg-server-xvfb'
)
source=("$_name-$pkgver.tar.gz::https://github.com/insolor/async-tkinter-loop/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5ef34f2612003341d147832becfe1978dadad55c6d5c532e30dc8a5bfd5c6d64')

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=. dbus-run-session xvfb-run pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
