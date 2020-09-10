# Maintainer: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=2.2.2
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
url="https://gitlab.com/mrossinek/cobib"
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz" "https://gitlab.com/mrossinek/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('54632fc9a97d2938436d23608e3558f43234a8f5952226f368455b70440887f9a5f20182efa213d3a138c8c59c74d6c84987edd92987c55958bedeaa5ea0d857'
            '8714d6bf572e185be9b90b7cd98da11882ebdcba0724f6894b6cec9d5def79df4348e08b2a8ae81e5a2ad0a5be87020adbdb0b43d67f23c5eb076581fe76515e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make install_extras
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
