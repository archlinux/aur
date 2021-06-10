# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-requests-unixsocket
_name="${pkgname#python-}"
pkgver=0.2.0
pkgrel=2
pkgdesc="Use requests to talk HTTP via a UNIX domain socket"
arch=('any')
depends=('python' 'python-requests' 'python-urllib3')
makedepends=('python-setuptools' 'python-pip' 'python-pbr')
url="https://github.com/msabramo/requests-unixsocket"
license=('Apache')
options=('!emptydirs')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'fix_setuptools_warnings.patch')
b2sums=('cda02b5d963b00fb06cf86819bcbf552ecc21e30064198da338f502f47547a1f93184fd06052047c6cb8a6181f0a2f7b7a7cc53183b18dc22165a41dc14144b5'
        'fdb486b0916eb8293b21510aa9dcae9875eb8d6bcb00d1aa3b0278fbe25b12d97df35682199ba468c98ca2ae58b9281a7a44c815600e19e5ff796bbbdd27380a')

prepare() {
  cd "$_name-$pkgver"

  patch --forward --input="${srcdir}/fix_setuptools_warnings.patch"
}

build() {
  cd "$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
