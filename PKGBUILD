# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=3.2.4
pkgrel=2
pkgdesc="Your Debian-based data center in a box"
arch=('any')
url="https://debops.org/"
license=('GPL-3.0-or-later')
depends=(
  'ansible'
  'encfs'
  'gnupg'
  'python-distro'
  'python-dotenv'
  'python-jinja'
  'python-pyxdg'
  'python-toml'
  'python-yaml'
  'python'
  'util-linux'
)
optdepends=(
  'python-dnspython: required by Ansible "dig" module'
  'python-pyopenssl: required by "openssl_*" Ansible modules'
  'python-netaddr: required by Ansible "ipaddr" filter plugin'
  'python-ldap: required by Ansible "ldap_*" modules'
  'python-passlib: required by Ansible "password" lookup plugin')
makedepends=('python-setuptools')
conflicts=('debops-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('9bc1c2144b9f2eaf10946e366433f980a4f257ed109df1b8be51f3be74535d5a01118be0720b60cf598c1ce55b9c4309a609e9dfaed315a457b6635b00008efa'
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
