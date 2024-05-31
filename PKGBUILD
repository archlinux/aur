# Maintainer: Hannes Hegewald <mail at hns dot me>
# Contributor: Andrej Radović <r.andrej@gmail.com>
pkgname=python-intellimouse-ctl-git
_name=${pkgname#python-}
pkgver=r24.b54424b
pkgrel=1
pkgdesc="A cross-platform command line tool and library for Microsoft's IntelliMouse devices."
url="https://github.com/madsl/Pro-IntelliMouse-Control-Panel"
depends=(
    'python'
    'python-hidapi'
)
makedepends=(
	'python-build'
	'git'
)
license=('MIT')
arch=('any')
conflicts=("python-intellimouse-ctl")

source=("${pkgname}::git+https://github.com/madsl/Pro-IntelliMouse-Control-Panel.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
