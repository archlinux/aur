# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=bloodhound
pkgname="python-$_name-ce"
pkgver=1.9.1
_commit=50fa194029837de4dc7d8297c01464f56a1bf31c
pkgrel=1
pkgdesc="Python based ingestor for BloodHound"
arch=('any')
url="https://github.com/dirkjanm/$_name.py"
license=('MIT')
depends=(
  'python>=3.7'
  'python-dnspython'
  'python-ldap3>=2.5'
  'python-ldap3-ad-auth>=0.1.0'
  'python-pyasn1>=0.4'
  'python-pycryptodome'
  'impacket>=0.9.17'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=42.0.0'
  'git'
)
source=("$_name::git+$url?signed#commit=$_commit")
b2sums=('199cd9a3830bbc73f7f75733b51e40f5f9607f75c22f3855f85c592a1148a5af786b5552645b60e6919d2678e6549e4b63511fae45b14668847541ed5528f43f')
validpgpkeys=('6D29A790AA820F7A51602DDC79653F553AEA621E') # Dirk-jan Mollema <dirkjan@outsidersecurity.nl>

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
