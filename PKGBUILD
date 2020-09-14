# Maintainer: Cullen Ross <cullenrss@gmail.com>
# Co-Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>

pkgname=cobib
pkgver=2.3.3
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/mrossinek/${pkgname}"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests')
source=("https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('1deaceb5317b7f1c89ca4eb5ba6a3c844959c457ea082c3f4cebac2104423327d435d5126f7e1699291d9d80330e9f960e8cde87a0754dc67d261531724876d4')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make install_extras
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
