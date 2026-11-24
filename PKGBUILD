# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=aye-chat
pkgver=0.57.0
pkgrel=1
pkgdesc="AI-powered terminal workspace"
arch=('any')
url="https://github.com/acrotron/aye-chat"
license=('MIT')
depends=('python' 'python-chromadb' 'python-httpx' 'python-keyring' 'python-pathspec' 'python-pillow' 'python-prompt_toolkit' 'python-pygments' 'python-rapidfuzz' 'python-rich' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/a/ayechat/ayechat-${pkgver}.tar.gz")
sha256sums=('85155e3e664a224c91f10db591970c51af27bad049bf9a2805387adbb714abd9')

build() {
  cd "ayechat-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "ayechat-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
