# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=viat
pkgver=0.10.6
pkgrel=1.314
pkgdesc='A tool for managing virtual file attributes'
url='https://github.com/v--/viat'
arch=('any')
license=('Unlicense')
checkdepends=(python-pytest python-pygit2)
makedepends=(git python-hatchling python-build python-installer python-wheel python-click-man groff)
depends=(python python-click python-fastjsonschema python-tomli-w python-wcmatch)
optdepends=(
  'python-pygit2: Git file tracker'
)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('0b873bbee46585c6a4f11c8af48f1d5187013505ca00e124522624d627ca3f6b')

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
