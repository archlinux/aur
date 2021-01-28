# Maintainer : Darshit Shah <git@darnir.net>
#
pkgname=firefly-cli
pkgver=0.0.9
pkgrel=2
pkgdesc="A python-based command line interface for practically entering expenses in Firefly III"
url="https://github.com/afonsoc12/firefly-cli"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python' 'python-certifi' 'python-chardet' 'python-idna' 'python-numpy'
'python-pandas' 'python-dateutil' 'python-pytz' 'python-requests' 'python-six'
'python-tabulate' 'python-urllib3' 'python-pyxdg')

# makedepends=('python-distribute')
source=("https://github.com/afonsoc12/firefly-cli/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "0001-Switch-xdg-to-pyxdg-module.patch")
md5sums=('7bedf161cdb0171e5976fa6df6b199fa'
         '24a8f3033594570e52e8c8577a1bf656')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/0001-Switch-xdg-to-pyxdg-module.patch"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
