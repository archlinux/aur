# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=python-ten-git
_pkgname=ten
pkgver=r156.bf4098b
pkgrel=1
pkgdesc='A (small) web exploit framework for Python.'
arch=('any')
url='https://github.com/cfreal/ten'
license=('custom')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname" "python-$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
