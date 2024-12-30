# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=geowordlists-git
_pkgname="${pkgname%-git}"
pkgver=1.0.1.r105.g798fe1d
pkgrel=1
pkgdesc="Tool to generate wordlists of passwords containing cities at a defined distance around the client city."
arch=('any')
url="https://github.com/p0dalirius/geowordlists"
license=('custom:unknown')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# https://wiki.archlinux.org/title/Python_package_guidelines#Standards_based_(PEP_517)
build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
