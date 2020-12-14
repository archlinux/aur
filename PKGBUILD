# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=0.1.2
pkgrel=1
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('any')
url="https://gitlab.com/whynothugo/darkman"
license=('ISC')
depends=('python-astral' 'python-dateutil' 'python-pyxdg' 'python-txdbus')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('94859e8924740dac9445610cadc03d7cd5c8b27ced1e310438e1e0f20a5da48da00c781a51ee84507b4806aefe2d09c9f6cc7a93e5207f445120aed6ac5ba190')

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
