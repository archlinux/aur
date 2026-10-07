# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
_name=pypykatz
pkgname="python-$_name"
pkgver=0.6.13
pkgrel=1
pkgdesc="Partial Mimikatz implementation in pure Python."
url="https://github.com/skelsec/$_name"
arch=('any')
license=('MIT')
depends=(
  'python>=3.6'
  'python-minidump>=0.0.21'
  'python-minikerberos>=0.4.1'
  'python-msldap>=0.5.7'
  'python-aiowinreg>=0.0.11'
  'python-aiosmb>=0.4.8'
  'python-aesedb>=0.1.4'
  'python-unicrypto>=0.0.10'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=61.0.0'
  'git'
)
source=("git+$url#tag=$pkgver")
b2sums=('ec6e03dd96913df2491f5a754f0c2621067676a75c813b5bf70b24706f6f0aeac89679bf637b5428fcd29ed01a7ac86284882e82bccadda0edd379ce9d723f86')

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
