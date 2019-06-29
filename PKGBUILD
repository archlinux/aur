# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=instalooter
pkgver=2.4.0
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
sha256sums=('7a50cea27bb813a5907f9377ed1faf144800cd3ffdd4d0a3c875f347f21d670e')

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
