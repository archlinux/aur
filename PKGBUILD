# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="aider-chat"
_pkgname="$pkgname"
pkgver=0.30.0
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
)
makedepends=("python-packaging" "python-build" "python-installer" "python-wheel")
optdepends=("python-sounddevice: portaudio support"
            "python-soundfile: portaudio support")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('3525c666296fc3ed318362e5b484d55ff08811a5434607507462d070d9dfb17d7add71f048586a12dad3a95f2d6ee447e40118f4e7893acc6f59f588db2ea413')
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
