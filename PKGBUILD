# Maintainer: Andrea Scarpino <andrea at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Ainola
# Contributor: Chris Fordham

pkgname=python2-botocore
pkgver=1.13.39
pkgrel=1
pkgdesc='A low-level interface to a growing number of Amazon Web Services'
arch=('any')
url="https://github.com/boto/botocore"
license=('Apache')
depends=('python2-dateutil' 'python2-jmespath' 'python2-docutils' 'python2-urllib3')
makedepends=('python2-setuptools')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        $pkgname-cap-dateutil-version.patch::https://github.com/boto/botocore/commit/e87e7a745f.patch)
md5sums=('5d41b0a0ce8aba26f6c1c5b66e9494d9'
         '11307e5c6eddd77cc5ea4be17550a4a7')

prepare() {
  cd botocore-$pkgver
  patch -Rp1 -i ../$pkgname-cap-dateutil-version.patch
}

build() {
  cd botocore-$pkgver
  python2 setup.py build
}

package() {
  cd botocore-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

