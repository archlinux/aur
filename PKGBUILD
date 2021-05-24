# Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=3.1.0
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/mrossinek/${pkgname}"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests')
source=("https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('a420f4126063b78ac3ebb1aa84f8159416335efaffc5863e122e7cc968133b2775080657d73c587851b9d05f0ef25439e816ada91986ecdd94d22f0601fc2f43')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install_extras
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
