# Maintainer: Jason Nader <jason.nader@protonmail.com>
pkgname=("virtualfish-git")
_pkgname=virtualfish
pkgver=r345.a19000a
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url="https://github.com/justinmayer/virtualfish"
license=("MIT")
depends=("python-pkgconfig" "python-psutil" "python-virtualenv" "fish")
makedepends=("git" "python-setuptools" "python-dephell")
source=("${pkgname%-*}::git+https://github.com/justinmayer/virtualfish.git")
md5sums=('SKIP')
provides=("virtualfish")
conflicts=("virtualfish")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
