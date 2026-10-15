# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-dploot"
pkgver=4.1.2
pkgrel=2
_commit='bdff349825fd1d8cdf026df03db6cf45bb4d27ee'
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
b2sums=('2f9ef6703d462976f4ccd49eaff60bd369370ee95ee79cc1cb37c1a037b62452943e346a70c6b269468dd8f8afd5f6db8b3f81005a15fa0df950ceb89b3664f4')

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
