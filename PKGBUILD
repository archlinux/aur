# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=instalooter
pkgver=2.4.4
pkgrel=1
pkgdesc='Another API-less Instagram pictures and videos downloader'
arch=('any')
url=https://github.com/althonos/InstaLooter
license=('GPL3')
depends=('python-coloredlogs' 'python-dateutil' 'python-docopt'
         'python-fs' 'python-requests' 'python-six'
         'python-tenacity' 'python-tqdm' 'python-verboselogs')
makedepends=('python-setuptools')
#checkdepends=('python-contexter' 'python-mock' 'python-parameterized'
#              'python-piexif' 'python-pillow')
optdepends=('python-piexif: to add EXIF metadata to downloaded pictures'
            'python-pillow: to add EXIF metadata to downloaded pictures')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fb9b4a948702361a161cc42e58857e3a6c9dafd9e22568b07bc0d0b09c3c34a9')

prepare() {
  cd $pkgname-$pkgver
  # fixes library versions for tenacity and coloredlogs 
  sed -e 's/6.0/8.0/g' -i setup.cfg
  sed -e 's/14/15/g' -i setup.cfg
}
build() {
  cd $pkgname-$pkgver
  python setup.py build
}

#check() {
#  cd $pkgname-$pkgver
#  UA="Mozilla/5.0 (X11; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0"
#  python -c "from instalooter.looters import InstaLooter; \
#    InstaLooter._cachefs.settext(u'user-agent.txt', u'$UA')"
#  python -m unittest discover
#}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
