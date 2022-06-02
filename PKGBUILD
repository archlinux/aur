# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=3.0.2
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
sha512sums=('73e395b23b3f82426f7420b8b8a511bb4a6216da8765b8563355006784fb0270c7d7c27684aa9e58455e0196fe81175cfea3fdbbb61c61383e832864f06db735'
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
