# Maintainer: James An <james@jamesan.ca>

pkgname=python2-gsutil
_pkgname=${pkgname#python2-}
pkgver=4.39
pkgrel=2
pkgdesc='A command line tool for interacting with cloud storage services.'
arch=('any')
url="https://cloud.google.com/storage/docs/$_pkgname"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('565f4eac3c71095fe612252e304fb0ff')

build() {
  cd "$_pkgname-$pkgver"

  python2 setup.py build
}

check() {
  cd "$_pkgname-$pkgver"

  python2 setup.py test
}

package() {
  cd "$_pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  find $pkgdir -type f -exec chmod 0644 {} +
  find $pkgdir -type d -exec chmod 0755 {} +
}
