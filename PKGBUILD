# Maintainer: Yaron de Leeuw < me at jarondl dot net >
pkgname=python-logfury
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=2
pkgdesc="Responsible, low-boilerplate logging of method calls for python libraries"
arch=('any')
url="https://github.com/reef-technologies/logfury"
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-pip')
#checkdepends=('python-nox' 'python-coverage')

# https://wiki.archlinux.org/title/Python_package_guidelines#Source
# Update to PyPI package due to following warning:
# > Make sure you're either building from a fully intact git repository or PyPI tarballs. Most other
# > sources (such as GitHub's tarballs, a git checkout without the .git folder) don't contain the
# > necessary metadata and will not work.
source=("logfury-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('e62ba75293f93bfe2ea8dfaa20a478d8977800546e55bf511f409f5d89727c505297dbd84adbef1c47f8916b7551801fe4bbb3ae8dd22c6613b8942f25e80e9a')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Efficacy of the check is disputed, disable for now as it causes issues, see comments on AUR:
# * https://wiki.archlinux.org/title/Python_package_guidelines#Check
# * https://aur.archlinux.org/packages/python-logfury/
#check() {
#  cd "$srcdir/$_name-$pkgver"
#  nox -vs test
#}
