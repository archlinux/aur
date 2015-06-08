# Maintainer: Juhani Numminen <juhaninumminen0@gmail.com>

pkgname=fortuner2
pkgver=2014.11.1
pkgrel=2
pkgdesc='Shows a fortune as a notification'
arch=('any')
url='https://github.com/jnumm/fortuner2'
license=('GPL3')
depends=('fortune-mod' 'libnotify' 'gettext' 'gtk-update-icon-cache')
install="${pkgname}.install"
source=("https://github.com/jnumm/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a3ba4356ea9cf14a1212f72ab0e3dc4848f7fb1afe25fb9077373683a453949c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix=/usr sysconfdir=/etc
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" prefix=/usr sysconfdir=/etc install

  install -d "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 README.md doc/fortuner2.conf.ex \
    "${pkgdir}/usr/share/doc/${pkgname}/"
}
