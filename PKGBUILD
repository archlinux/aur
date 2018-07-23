# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: György Balló <ballogy@freestart.hu>

pkgbase=python-flickrapi
pkgname=(python-flickrapi python2-flickrapi)
pkgver=2.4.0
pkgrel=2
pkgdesc="The official Python interface to the Flickr API"
arch=('any')
url="http://stuvel.eu/flickrapi"
license=('Python')
makedepends=('python-docutils' 'python2-docutils' 'python-setuptools' 'python2-setuptools' 'python-requests-toolbelt' 'python2-requests-toolbelt'
             'python-requests-oauthlib' 'python2-requests-oauthlib' 'python-six' 'python2-six')
checkdepends=('python-nose' 'python2-nose')
source=("https://pypi.io/packages/source/f/flickrapi/flickrapi-$pkgver.tar.gz")
sha512sums=('8c14a00850fa0d70d5f0f0e856425b09cd25746f8ed3aaf34f59e0f8e8567ebb814893ddc3c768500207ec1fd437179ccae24d39a167f116020d4cb97d4cce1d')

prepare() {
  cp -a flickrapi-$pkgver{,-py2}

  cd flickrapi-$pkgver-py2
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd flickrapi-$pkgver
  python setup.py build

  cd ../flickrapi-$pkgver-py2
  python2 setup.py build
}

check() {
  # Tests not shipped
  return

  cd flickrapi-$pkgver
  python runtests

  cd ../flickrapi-$pkgver-py2
  python2 runtests
}

package_python-flickrapi() {
  depends=('python-six' 'python-requests-oauthlib' 'python-requests-toolbelt')

  cd flickrapi-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-flickrapi() {
  depends=('python2-six' 'python2-requests-oauthlib' 'python2-requests-toolbelt')

  cd flickrapi-$pkgver-py2

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
