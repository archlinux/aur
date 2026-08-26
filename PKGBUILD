# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

_name="pypsrp"
pkgname="python-$_name"
pkgver=0.9.1
pkgrel=1
pkgdesc="Python PowerShell Remoting Protocol Client Library"
url="https://github.com/jborean93/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.10'
  'python-cryptography>=3.1'
  'python-requests>=2.27.0'
  'python-pyspnego>=0.7.0'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=77.0.0'
  'git'
)
#checkdepends=(
#  'python-pytest'
#  'python-pytest-cov'
#  'python-pytest-mock'
#  'python-xmldiff'
#)
optdepends=(
  'python-krb5: for Kerberos authentication on Linux'
  'python-gssapi: For Kerberos authentication on Linux'
  'python-requests-credssp: for CredSSP authentication'
)
source=("git+$url#tag=v$pkgver")
b2sums=('8b69e818f35ad6b426d2ebc08243a9af955361072025e01ca2b73cbe125533503ac198cb1c13d36232d3430dad68610c2f1111860a1722b3ce0481c6f827a26e')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

#check() {
#  cd "$_name"
#  pytest
#}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
