# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=i3-workspace-switch-git
pkgver=r4.cb7f6de
pkgrel=1
pkgdesc="Utility to allow switching workspaces by their position on the output"
arch=(any)
url="https://github.com/languitar/i3-workspace-switch"
license=('LGPL3')
depends=( 'python-i3-py' 'i3' 'python')
makedepends=('git' 'python-setuptools')
provides=('i3-workspace-switch')
conflicts=('i3-workspace-switch')
source=(${pkgname}::git+${url})
sha256sums=('SKIP')



pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  }
