# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-dploot"
pkgver=4.0.0
pkgrel=1
_commit='ec05215bef2ed122218c6591bdfda0c001ac729e'
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
  'python-pycryptodomex'
  'python-pypsrp>=0.9.1'
  'python-pick>=2.6.0'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-poetry-core>=1.0.0'
  'git'
)
source=("git+$url#commit=$_commit")
b2sums=('dfa74491b012a0598aa261b048f7c3e3b99b6c61d74a5b2561caaca187d184698ed1929f25dfebe4e000e1ad4a5bd0f2e3ecc9b90b3b0d04d06956b32d6b12c4')

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
