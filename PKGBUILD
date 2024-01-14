# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="$pkgname"
pkgver=0.21.1
pkgrel=1
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
b2sums=('44b0dff0aa5bb7bd3b024b7d74469837462a41d81e48394345ba27c3f744f699eccc270c2c4030b3abe407c542d397925da88b1da62b08b42a6c46a338904e45')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 # remove three files that should not be there
 find "$pkgdir/usr/lib/" -depth -type d \( -name "benchmark" -o -name "tests" \) -exec rm -rf {} \;
}
