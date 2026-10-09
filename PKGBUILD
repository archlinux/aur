# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
pkgname=python-msldap
pkgver=0.5.15
pkgrel=1
pkgdesc="Python library to play with MS LDAP"
url="https://github.com/skelsec/msldap"
arch=('any')
license=('MIT')
depends=(
  'python>=3.7'
  'python-unicrypto>=0.0.10'
  'python-asyauth>=0.0.18'
  'python-asysocks>=0.2.11'
  'python-asn1crypto>=1.3.0'
  'python-winacl>=0.1.8'
  'python-prompt_toolkit>=3.0.2'
  'python-tqdm'
  'python-wcwidth'
  'python-tabulate'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('0f1e31b44dd44aca046724a7f20028e05819dac18117d32560ca8e097c25ef6f7d21fdf400986b6c49d049148791835fc3218466a7e6c99c0210a8b20fad8d92')

prepare() {
  git -C msldap clean -dfx
}

build() {
  cd msldap
  python -m build -wnx
}

package() {
  cd msldap
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
