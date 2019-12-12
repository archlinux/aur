# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=instalooter
pkgver=2.4.1
pkgrel=1
pkgdesc='Another API-less Instagram pictures and videos downloader'
arch=('any')
url=https://github.com/althonos/InstaLooter
license=('GPL3')
depends=('python-coloredlogs' 'python-dateutil' 'python-docopt'
         'python-fs' 'python-requests' 'python-setuptools' 'python-six'
         'python-tenacity' 'python-tqdm' 'python-verboselogs')
checkdepends=('python-contexter' 'python-mock' 'python-parameterized'
              'python-piexif' 'python-pillow')
optdepends=('python-piexif: to add EXIF metadata to downloaded pictures'
            'python-pillow: to add EXIF metadata to downloaded pictures')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('aa65caaff3b43bd05288476765282165c7ca78e9de2e8ab9b796977b73d0320a')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  UA="Mozilla/5.0 (X11; Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0"
  python -c "from instalooter.looters import InstaLooter; \
    InstaLooter._cachefs.settext(u'user-agent.txt', u'$UA')"
  python -m unittest discover
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
