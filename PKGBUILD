# Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=3.5.0
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/mrossinek/${pkgname}"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-requests-oauthlib')
source=("https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('4eae5db4f9becfb3a01a5ee534eccfb933b88d27601182a90c2313572718b4aa12534b92036fe5178c356988cb781b83f2fb60af78cbf9c4091d644ed4904432')

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
