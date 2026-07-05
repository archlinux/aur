# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
# Contributor: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=cai
pkgver=0.15.4
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
  'b24f4dee0f9a2ade16891e890c58c69abec0561696c78d84fc4351318e1853d6'
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
