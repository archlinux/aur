# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=ldap3-ad-auth
pkgname="python-$_name"
pkgver=0.1.1
_commit=51f7ff67b7f0676a59a5471dc3e8e1b676d2c9d2
pkgrel=1
pkgdesc="ldap3 adapter for NTLM/Kerberos signing and channel binding"
arch=('any')
url="https://github.com/dirkjanm/$_name"
license=('MIT')
depends=(
  'python>=3.9'
  'python-ldap3>=2.9.1'
  'impacket>=0.13.1'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=77.0.3'
  'git'
)
checkdepends=(
  'python-pycryptodome'
)
source=("git+$url#commit=$_commit")
b2sums=('3586d7e53a0ab3ac5765dace11ad67c6109c7f8ca3bfc6b2ab2e07d2d04e37e4088c0f80c2bacbaa120d644cea34e1a0d8a5c11eb5435bda59a1655f6aefb765')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

check() {
  cd "$_name"
  python -m unittest tests/test_protection.py
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
