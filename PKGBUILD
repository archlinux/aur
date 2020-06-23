# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=2.1.0
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
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('8c4b6067139c39e0a367afc00414b899cce6d83a7943802ea03c08c22b6b0a30e7433b230af1e39648c18b8aa192f6a4ab44f5d2586905ec34daccc54b6da546')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
