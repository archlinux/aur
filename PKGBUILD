# Maintainer: Damglador <damglador@gmail.com>

pkgname=xkb-editor
pkgver=0.1.0
pkgrel=1
pkgdesc='Edit or create keyboard layouts'
arch=(any)
url='https://github.com/Damglador/xkb-editor'
license=(GPL-3.0-only)
depends=(
  python
  pyside6
  kirigami
  qqc2-desktop-style
  kitemmodels
  python-lark
  python-pydantic
  libxkbcommon
  hicolor-icon-theme
)
makedepends=(
  git
  qt6-tools # for building translations
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=(
  "$pkgname::git+https://github.com/Damglador/xkb-editor#tag=v$pkgver"
  # "$pkgname::git+https://github.com/Damglador/xkb-editor"
)

sha256sums=('SKIP')

build() {
  cd "$pkgname"

  make -C translations/
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # appdata
  install -vDm644 -t "$pkgdir/usr/share/applications" ./*.desktop
}
