# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=viat
pkgver=0.10.7
pkgrel=2.314
pkgdesc='A tool for managing virtual file attributes'
url='https://github.com/v--/viat'
arch=('any')
license=('Unlicense')
checkdepends=(python-pytest python-pygit2)
makedepends=(python-uv-build python-build python-installer python-click-man)
depends=(python python-click python-fastjsonschema python-tomli-w python-wcmatch)
optdepends=(
  'python-pygit2: Git file tracker'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('0fe22d0607de630852dc0dbb6ad794f467f8394395783cfd088799599e26fcd7')

_fullsrcdir() {
    echo "$srcdir/$pkgname-$pkgver"
}

check() {
    cd "$(_fullsrcdir)"
    pytest
}

build() {
    cd "$(_fullsrcdir)"
    python -m build --wheel --no-isolation
}

package() {
    cd "$(_fullsrcdir)"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
