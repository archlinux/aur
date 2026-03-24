# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name="certipy"
pkgname="python-$_name-ad-git"
pkgver=5.0.4.r3.g890dbf8
pkgrel=1
pkgdesc="Tool for Active Directory Certificate Services enumeration and abuse"
arch=(any)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/ly4k/$_name"
license=('MIT')
depends=(
  'python>=3.12'
  'python-asn1crypto>=1.5.1'
  'python-cryptography>=42.0.8'
  'impacket>=0.13.0'
  'python-ldap3>=2.9.1'
  'python-pyasn1>=0.6.1'
  'python-dnspython>=2.7.0'
  'python-requests>=2.32.3'
  'python-pycryptodome>=3.22.0'
  'python-beautifulsoup4>=4.13.4'
  'python-httpx>=0.28.1'
  'python-argcomplete>=3.6.2'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=69.0'
  'git'
)
optdepends=(
  'python-neo4j: For BloodHound output'
)
source=("git+$url")
b2sums=('SKIP')

prepare() {
  git -C "$_name" clean -dfx
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir/" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
