# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name=certihound
pkgname="python-$_name"
pkgver=0.3.2
pkgrel=1
pkgdesc="ADCS collector library for BloodHound CE"
arch=('any')
url="https://github.com/0x0Trace/$_name"
license=('MIT')
depends=(
  'python>=3.10'
  'python-ldap3>=2.9.1'
  'python-cryptography>=41.0.0'
  'python-pydantic>=2.0'
  'python-click>=8.1.0'
  'python-rich>=13.0.0'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=61.0'
  'git'
)
checkdepends=(
  'python-pytest>=7.0.0'
  'python-pytest-cov>=4.0.0'
)
optdepends=(
  'python-gssapi>=1.8.0: Kerberos support'
)
source=("git+$url#commit=b7ef60e567f4439e944f3fcbacb633d513c0baea")
b2sums=('2d5a592a2a55c05d4f2981f6fa379c1da1a5129efd19771ca1e8580b388734e59761ea45c954b6d297cdffd8c6d5c1317365e51e5aebe67cc20acf686e4ca36f')

prepare() {
  git -C "$_name" clean -dfx
}

build() {
  cd "$_name"
  python -m build -wnx
}

check() {
  cd "$_name"
  pytest
}

package() {
  cd "$_name"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 syntax=PKGBUILD et:
