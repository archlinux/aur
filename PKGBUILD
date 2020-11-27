# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-pytest-localserver in [community]

_name=pytest-localserver
pkgname=python2-$_name
pkgver=0.5.0
pkgrel=3
pkgdesc='py.test plugin to test server connections locally'
arch=('any')
license=('MIT')
url="https://bitbucket.org/pytest-dev/$_name"
depends=('python2-pytest' 'python2-werkzeug')
makedepends=('python2-setuptools')
checkdepends=('python2-requests')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('aedf1e1c9563396457070df13df228ad0ebdd19173fa2ac5a598288d3e1a1ac8b8a0c0288cba0d8478e43d2e1de4848f2393bf640705916957f12ab31171c6cc')

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  # Hack entry points by installing it
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1 --skip-build
  PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH" py.test2
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
