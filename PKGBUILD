# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=3.0.4
pkgrel=1
pkgdesc="Your Debian-based data center in a box"
arch=('any')
url="https://debops.org/"
license=('GPL3')
depends=(
  'ansible'
  'encfs'
  'gnupg'
  'python-distro'
  'python-dotenv'
  'python-future'
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
conflicts=('depops-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('6b5f1c4fa81a3ffa159f2ec1fbc2de0390ce2b7ef3eb404a0feda4d3708661a914630e2cb3c9c7a86d5ae88951ee861c4fdbee5128e82cdbf67a6f766f3336a6'
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
