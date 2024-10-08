# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=3.2.2
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
sha512sums=('7c027251f175f8f8966df8062818ec7b61f66e5a5ce6b1aeac6e004166f5c0caf8290ac3bd14cb9f3e79e0c3c133db9ebcdd62a9c0bbabca3b8d12a654ee4b96'
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
