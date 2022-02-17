# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=3.0.1
pkgrel=1
pkgdesc="Your Debian-based data center in a box"
arch=('any')
url="https://debops.org/"
license=('GPL3')
depends=('python' 'ansible' 'python-future' 'util-linux' 'encfs' 'gnupg')
optdepends=(
  'python-dnspython: required by Ansible "dig" module'
  'python-pyopenssl: required by "openssl_*" Ansible modules'
  'python-netaddr: required by Ansible "ipaddr" filter plugin'
  'python-ldap: required by Ansible "ldap_*" modules'
  'python-passlib: required by Ansible "password" lookup plugin')
makedepends=('python-setuptools')
conflicts=('depops-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('ab87521535fa168ecbe79dc083f21dbea6864d5782c83ccdf5b308c6df008930efb40d365f82d8411b5e3dbda7a13e5e1bdb0e09d4209420ebac153008fb2ca9'
            'SKIP')

# gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 27067A91D620EE91D50309D92DCCF53E9BC74BEC
validpgpkeys=('27067A91D620EE91D50309D92DCCF53E9BC74BEC')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
