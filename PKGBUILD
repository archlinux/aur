# Maintainer:
# Contributor: nblock <nblock [/at\] archlinux DOT us>

_pkgname="organize"
pkgname="$_pkgname"
pkgver=3.2.5
pkgrel=1
pkgdesc='A command line utility to automate file organization tasks'
url='https://github.com/tfeldmann/organize'
license=('MIT')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('51c8b42b12366fe41943e678df4e71f9f4cd2aa1d9ac2a3d3be8531adbee4dc2')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  depends+=(
    'docx2txt'
    'python-arrow'
    'python-docopt'
    'python-jinja'
    'python-natsort'
    'python-pdfminer'
    'python-platformdirs'
    'python-pydantic'
    'python-rich'
    'python-send2trash'
    'python-yaml'

    ## AUR
    'python-exifread'
    'python-simplematch'
  )

  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
