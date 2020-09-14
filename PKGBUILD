# Maintainer: Cullen Ross <cullenrss@gmail.com>
# Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>

pkgname=cobib
pkgver=2.3.4
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/mrossinek/${pkgname}"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests')
source=("https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('528863147acb722b4b63a0ad2296fae8cc29f9ce63c91d037964c5ca2bbec57b541782599d80dfea58f4fb5f49d7e39c53e4ad346622d25764cfe26632b2f861')

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
