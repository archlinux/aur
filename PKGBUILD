# Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=3.5.3
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/mrossinek/${pkgname}"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-requests-oauthlib')
source=("https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('8da04e18b157d5285bd3e2c39d02b173e96495656e38ea2af7ebd4a355d3efa5560710bbb7e561b06e36d4810e33f835ed91a16c65b7e3b2243bba243dac7ca7')

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
