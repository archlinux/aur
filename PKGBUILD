# Maintainer: David Birks <david@birks.dev>

pkgname=claude-code-transcripts
pkgver=0.6
pkgrel=1
pkgdesc='Convert Claude Code session files to HTML transcripts'
arch=('any')
url='https://github.com/simonw/claude-code-transcripts'
license=('Apache-2.0')
depends=('uv' 'python')
optdepends=('github-cli: for publishing to GitHub Gists')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/simonw/claude-code-transcripts/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('95167c666e4d34837b7492fd2a0490d5d9d460fdbbac68a41dfb1873a5ada36da6818093cc6932092a4055383daff3c0497340fcd40f1c78746f1a713a7c3f78')

build() {
  cd "$pkgname-$pkgver"
  uv build --wheel
}

package() {
  cd "$pkgname-$pkgver"

  # Create venv and install wheel
  uv venv "$pkgdir/usr/lib/$pkgname/venv" --python 3.14
  uv pip install --python "$pkgdir/usr/lib/$pkgname/venv/bin/python" dist/*.whl

  # Symlink to venv binary
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/venv/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
