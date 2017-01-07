# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-defusedxml-git
pkgname=("python-defusedxml-git" "python2-defusedxml-git")
pkgver=0.4.1
pkgrel=3
pkgdesc="XML bomb protection for Python stdlib modules"
arch=('any')
url='https://github.com/AdamWill/defusedxml'
license=('Python')
makedepends=('python' 'python2')
source=('defusedxml::git+https://github.com/AdamWill/defusedxml')
md5sums=('SKIP')

pkgver() {
  cd defusedxml
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a "defusedxml"{,-py2}
}

package_python-defusedxml-git() {
  depends=('python')
  conflicts=('python-defusedxml')
  provides=('python-defusedxml')

  cd defusedxml
  python3 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-defusedxml-git() {
  depends=('python2')
  conflicts=('python2-defusedxml')
  provides=('python2-defusedxml')

  cd defusedxml-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
