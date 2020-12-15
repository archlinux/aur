# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=0.1.3
pkgrel=1
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('any')
url="https://gitlab.com/whynothugo/darkman"
license=('ISC')
depends=('python-astral' 'python-dateutil' 'python-pyxdg' 'python-txdbus' 'geoclue')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('dcdb77a422e99f3c962f35f435be027d2c0e74603d16f8c6bbd07ddc7d49e8f845840c95614a8835fae6df7165174d05bbf3371b335cc475b33da15f4f36c584')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"

  # TODO: manpages

  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
  install -Dm 644 darkman.service "${pkgdir}/usr/lib/systemd/user/darkman.service"
}
