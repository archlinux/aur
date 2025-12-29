# Maintainer: David Birks <david@birks.dev>

pkgname=claude-code-transcripts
pkgver=0.4
pkgrel=1
pkgdesc='Convert Claude Code session files to HTML transcripts'
arch=('any')
url='https://github.com/simonw/claude-code-transcripts'
license=('Apache-2.0')
depends=('uv' 'python')
optdepends=('github-cli: for publishing to GitHub Gists')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/simonw/claude-code-transcripts/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('48ead2a16e62b93fc399056523e0b8a7f5eb4d8bdbf676d90d8bf46711623da0745d776e5f8676f3a7991282a45de459d83b44505d8b379cb93fbd80bc212bee')

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
