# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="aider_chat"
pkgver=0.36.0
pkgrel=2
pkgdesc="AI pair programming in your terminal"
url="https://aider.chat/"
license=("Apache2")
arch=("any")
provides=("aider")
depends=("litellm"
         "python-beautifulsoup4"
         "python-configargparse"
         "python-dotenv"
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
         "python-pypandoc"
         "python-playwright"
         "python-streamlit"
)
makedepends=("python-packaging" "python-build" "python-installer" "python-wheel")
optdepends=("python-sounddevice: portaudio support"
            "python-soundfile: portaudio support")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('8055e2566f69a596ab2e7d4a39719d5c86ab51132f37e23564dd819fd0b630b8f40321761dd738089515aca5140bcfc948086451e1a3d6fdd5b224e0347d85da')
options=("!strip")

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 # remove three files that should not be there
 find "$pkgdir/usr/lib/" -depth -type d \( -name "benchmark" -o -name "tests" \) -exec rm -rf {} \;
}
