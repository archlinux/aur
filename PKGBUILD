# Maintainer: Donald Webster <fryfrog@gmail.com
# Contributor: Dylan Whichard <dylan@whichard.com>

pkgname=('python-schedule' 'python2-schedule')
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc='Python job scheduling for humans.'
arch=('any')
url="https://github.com/dbader/schedule"
license=('MIT')
makedepends=('python-setuptools'
             'python2-setuptools')
checkdepends=('python-pytest'
              'python-mock'
              'python2-pytest'
              'python2-mock')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f9fb5181283de4db6e701d476dd01b6a3dd81c38462a54991ddbb9d26db857c9')

prepare() {
  cp -a schedule-${pkgver}{,-py2}
}

build() {
  cd "$srcdir"/schedule-${pkgver}
  python setup.py build

  cd "$srcdir"/schedule-${pkgver}-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/schedule-${pkgver}
  python setup.py test

  cd "$srcdir"/schedule-${pkgver}-py2
  python2 setup.py test
}

package_python-schedule() {
  depends=('python')
  cd "${srcdir}/schedule-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-schedule() {
  depends=('python2')
  cd "${srcdir}/schedule-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir" --optimize=1
}
