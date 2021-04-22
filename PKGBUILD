# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=python-pixcat
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=4
pkgdesc="CLI and Python 3.6+ API to display images on a kitty terminal with optional resizing."
arch=('any')
url='https://github.com/mirukana/pixcat'
license=('LGPL3')
depends=('python' 'python-blessed' 'python-pillow' 'python-docopt' 'python-requests' 'python-dataclasses' 'python-ansiwrap')
makedepends=('python-setuptools')
provides=('pixcat')
conflicts=('pixcat')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b9ee782a9a539af0f13bb412eb901765e41a02123c5c77723ee05aaf67b06419878c554bca6423e46cae40b7545f824eb0a3e0238fd36a4f8d5df1ce9aa30b8a')

build(){
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build

  # Fix permissions
  find "$pkgdir/usr/lib/python3.9/site-packages/" -type f -exec chmod 644 '{}' +
}
# vim:set ts=2 sw=2 et:
