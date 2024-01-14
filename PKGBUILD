# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="$pkgname"
pkgver=0.21.0
pkgrel=2
pkgdesc="AI pair programming in your terminal"
url="https://aider.chat/"
license=("Apache2")
arch=("any")
provides=("aider")
depends=("python-configargparse"
         "python-gitpython"
         "python-openai"
         "python-tiktoken"
         "python-jsonschema"
         "python-rich"
         "python-prompt_toolkit"
         "python-numpy"
         "python-scipy"
         "python-backoff"
         "python-pathspec"
         "python-networkx"
         "python-diskcache"
         "python-grep-ast"
         "python-yaml"
         "python-pillow"
         "python-diff-match-patch"
)
makedepends=("python-packaging" "python-build" "python-installer" "python-wheel")
optdepends=("python-sounddevice: portaudio support"
            "python-soundfile: portaudio support")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('3bbd48f85652f3209fff6204fb02cbcd4c489841c9a22a12fc9eb01d9107f9462de97cc949780abcb265dfa2126be25a4078ac1c235f4d8a32fecdc9e1d68007')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 # remove three files that should not be there
 rm -rf "$pkgdir/usr/lib/python3.11/site-packages/tests/"{__init__.py,__pycache__/__init__.cpython-311.pyc,__pycache__/__init__.cpython-311.opt-1.pyc}
}
