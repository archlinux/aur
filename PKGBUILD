# Maintainer:

_name="docx2txt"
_pkgname="python-$_name"
pkgname="$_pkgname"
pkgver=0.9
pkgrel=2
pkgdesc="A pure python based utility to extract text and images from docx files"
url="https://github.com/ankushshah89/python-docx2txt"
license=('MIT')
arch=('any')

depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="${_name//-/_}-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/$_pkgsrc.$_pkgext")
sha256sums=('18013f6229b14909028b19aa7bf4f8f3d6e4632d7b089ab29f7f0a4d1f660e28')

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir/usr/bin"/{docx2txt,docx2txt-py}
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
