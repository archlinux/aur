# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=google-colab-cli
pkgver=0.7.1
pkgrel=1
pkgdesc="CLI for interacting with Google Colab"
arch=('any')
url="https://github.com/googlecolab/google-colab-cli"
license=('Apache-2.0')
depends=('python'
         'python-click'
         'python-filelock'
         'python-google-auth'
         'python-google-auth-oauthlib'
         'python-html2text'
         'python-jupyter-kernel-client'
         'jupyter-nbformat'
         'python-packaging'
         'python-prompt_toolkit'
         'python-pydantic'
         'python-pygments'
         'python-requests'
         'python-rich'
         'python-typer'
         'python-typing_extensions'
         'python-websocket-client')
optdepends=('openssh: colab ssh (SSH-over-WebSocket access to the runtime VM)')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
# PyPI sdists lag the git tags (which nvchecker tracks), so build from the
# tag tarball; hatch-vcs gets the version via SETUPTOOLS_SCM_PRETEND_VERSION.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e70c8a95bd3a07652d22960f3dd1240b066e6201dd17ada749b48037cdce841')

build() {
  cd "$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
