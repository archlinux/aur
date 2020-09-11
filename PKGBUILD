# Maintainer: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=2.3.2
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
url="https://gitlab.com/mrossinek/cobib"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests')
source=("https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('d95fe6d0b49429768e2691d8bfa39badcfc150567beb521bf8748c1efc4f74dd891d2009cda77f0f8184799c34a6c95040e1751a8ad041def6a5b2ece820e610')

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
