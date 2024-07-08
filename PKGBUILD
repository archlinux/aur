# Maintainer:
# Contributor: nblock <nblock [/at\] archlinux DOT us>

_pkgname="organize"
pkgname="$_pkgname"
pkgver=3.2.3
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
sha256sums=('0437554ddf298b9896ccb64fb1e7ef9a861071298b231ead1403903687332d47')

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
