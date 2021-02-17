# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=0.2.0
pkgrel=1
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('any')
url="https://gitlab.com/whynothugo/darkman"
license=('ISC')
depends=('python-astral' 'python-dateutil' 'python-pyxdg' 'python-jeepney'
         'geoclue' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a6e0515b0f919900201961b9062590703d7c5be3defc3b74c9022ee1707cbcb65c9e1009d5d7c429b808ed84ddbf99e9658107ed251973ea8d911f223e891dc9')

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
