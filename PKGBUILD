# Maintainer: Thorsten Foltz <thorsten.foltz@live.com>
# Contributor: Thorsten Foltz <thorsten.foltz@live.com>
pkgname=cai
pkgver=0.16.1
pkgrel=1
pkgdesc="CLI tool that generates concise git commit messages from diffs or commit history using large language models"
arch=('any')
url="https://github.com/thorstenfoltz/cai"
license=('MIT')
depends=(
  python
  python-yaml
  python-pathspec
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
  '416d161fb79d42591355c14f64076c3d073131e578d4ce7a3ea9a9683feb95ea'
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
