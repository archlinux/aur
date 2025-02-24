# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: fossdd <fossdd@pwned.life>

__pkgname=pipx
_pkgname=python-$__pkgname
pkgname=$_pkgname-git
pkgver=r723.9ae41342
pkgrel=1
pkgdesc='Install and Run Python Applications in Isolated Environments'
arch=('any')
url='https://github.com/pipxproject/pipx'
license=('MIT' 'BSD')
conflicts=($_pkgname)
provides=($_pkgname)
depends=('python' 'python-userpath' 'python-argcomplete' 'python-packaging' 'python-platformdirs')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-wheel' 'python-hatch-vcs')
#checkdepends=('python-tox' 'python-pytest')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$__pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$__pkgname

  #SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
  python -m build -nw
}

#check() {
#  cd $srcdir/$__pkgname
#
#  nox
#}

package() {
  cd $srcdir/$__pkgname

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
