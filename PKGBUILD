# Maintainer: Răzvan <aurstuff@razv.xyz>
pkgname=nitro-ai-judge-cli
pkgver=2.2.1
pkgrel=2
pkgdesc="CLI client for judge.nitro-ai.org"
arch=('any')
url="https://github.com/MihneaTeodorStoica/nitro-ai-judge-cli"
license=('custom:unknown')
depends=('python')
conflicts=('naji-cli')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
  'docker: required for naji play commands'
  'docker-compose: required for docker compose support used by play commands'
)
source=("$pkgname::git+https://github.com/MihneaTeodorStoica/nitro-ai-judge-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir/usr/bin/naij" "$pkgdir/usr/bin/naji"
  rm -f "$pkgdir/usr/bin/nitro-cli"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
