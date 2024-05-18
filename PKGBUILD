# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="aider_chat"
pkgver=0.35.0
pkgrel=1
pkgdesc="AI pair programming in your terminal"
url="https://aider.chat/"
license=("Apache2")
arch=("any")
provides=("aider")
depends=("python-beautifulsoup4"
         "python-configargparse"
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
b2sums=('b62b3b96b8bb16737cb8ac0f7f53ac1306fa832eb97c37970549dcbf90e7e0b8b89cf36e23fb9a04d43f89117073d4aaa5d75ed02917b237964c57a8a6da205d')
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
