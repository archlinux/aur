# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-dploot"
pkgver=4.1.1
pkgrel=1
_commit='5b3f836cc7a35f5b9f14cb890b245c312e6675b1'
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
b2sums=('d2025ebcfc4b95411ddf9dad83a14afdcad341a768bc6b2b21ba393842cac40ef78cbfc8eeec7a5e16df0b68bc676bf199c0204944eaea33c7cea866f847a7c1')

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
