# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=0.1.4
pkgrel=1
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('any')
url="https://gitlab.com/whynothugo/darkman"
license=('ISC')
depends=('python-astral' 'python-dateutil' 'python-pyxdg' 'python-txdbus' 'geoclue')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('292825680cfbd6fc9efd1ee6d1114f040022748d94b598c774c0e17c2deccd607262a3933edccc3a1c9d6bcf722ecb9a87f7ca5b2bd64686653ddde25c4ab474')

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
