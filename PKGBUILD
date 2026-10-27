# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname=python-dploot
pkgver=4.1.3
pkgrel=1
_commit=cb0c18a0a812bddd378d6d0f71f703bbe91a9653
pkgdesc="DPAPI looting remotely in Python"
arch=('any')
url="https://github.com/zblurx/dploot"
license=('MIT')
depends=(
  'python>=3.10'
  'impacket>=0.13.0'
  'python-cryptography>=40.0.1'
  'python-pyasn1>=0.4.8'
  'python-lxml>=5.0'
  'python-pypsrp>=0.9.1'
  'python-questionary>=2.1.1'
  'python-pycryptodomex'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry-core>=1.0.0'
  'git'
)
source=("git+$url#commit=$_commit")
b2sums=('7dfccf0406a40372acf7a5732f9df8932ca42705ea60a362bdfc41b6bae65bb268a7a170f6ef3eaf54c3850f4cc4822d58a7bce97e234931cf3b09165623fa0d')

prepare() {
  git -C dploot clean -dfx
}

build() {
  cd dploot
  python -m build -wnx
}

package() {
  cd dploot
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
