# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
# Contributor: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=cai
pkgver=0.7.3
pkgrel=1
pkgdesc="CLI tool that generates concise git commit messages from diffs or commit history using large language models"
arch=('any')
url="https://github.com/thorstenfoltz/cai"
license=('MIT')
depends=(
  python
  python-yaml
  python-openai
  python-google-genai
  python-requests
  python-typer
  python-groq
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
  '1a32e8dc7c7d24397dddf5dca845eda5a760d0df85de9cdfcab8c528380e3497'
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
