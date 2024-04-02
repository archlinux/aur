# Maintainer: Jason Nader <jason.nader protonmail>

pkgname=("virtualfish-git")
_pkgname=virtualfish
pkgver=r407.2593997
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url="https://github.com/justinmayer/virtualfish"
license=("MIT")
depends=("python-pkgconfig" "python-psutil" "python-setuptools" "python-virtualenv" "fish")
makedepends=("git" "python-build" "python-installer" "python-wheel" "python-poetry-core")
source=("${pkgname%-*}::git+https://github.com/justinmayer/virtualfish.git")
md5sums=('SKIP')
provides=("virtualfish")
conflicts=("virtualfish")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
