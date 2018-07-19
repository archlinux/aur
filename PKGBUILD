# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Hideaki Takahashi <mymelo+aur@gmail.com>
# Contributor: Vincent Demeester <vincent@sbr.pm>

pkgname=(python-dockerpty python2-dockerpty)
pkgver=0.4.1
pkgrel=3
pkgdesc="Python library to use the pseudo-tty of a docker container"
arch=('any')
license=('Apache')
url="https://github.com/d11wtq/dockerpty"
makedepends=('python-setuptools' 'python2-setuptools' 'python-docker-py' 'python2-docker-py'
             'python-six' 'python2-six' 'git')
checkdepends=('python-pytest' 'python2-pytest' 'python-expects' 'python2-expects')
source=("git+https://github.com/d11wtq/dockerpty.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a dockerpty{,-py2}
}

build() {
  cd "$srcdir/dockerpty"
  python setup.py build

  cd "$srcdir/dockerpty-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/dockerpty"
  py.test

  cd "$srcdir/dockerpty-py2"
  py.test2
}

package_python-dockerpty() {
  depends=('python-six' 'python-docker-py')

  cd dockerpty
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-dockerpty() {
  depends=('python2-six' 'python2-docker-py')

  cd dockerpty-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
