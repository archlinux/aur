# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
# Contributor: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=cai
pkgver=0.10.0
pkgrel=1
pkgdesc="CLI tool that generates concise git commit messages from diffs or commit history using large language models"
arch=('any')
url="https://github.com/thorstenfoltz/cai"
license=('MIT')
depends=(
  python
  python-yaml
  python-openai
  python-requests
  python-typer
  git
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-setuptools-scm
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/thorstenfoltz/cai/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
  '0b0a6c858cad65098b1310b734afc555a7aef6f03cb722c85f95f13da64011f0'
)
build() {
    cd "$srcdir/cai-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_GIT_CAI_CLI="$pkgver"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/cai-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
