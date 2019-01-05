# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=bettergram
_pkgname=Bettergram
pkgver=1.3.12
pkgrel=1
pkgdesc="Bettergram is an improved version of the Telegram messaging app with 50 pins, favorites, sortable categories, and more."
arch=('x86_64')
url="https://bettergram.io"
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://bettergram.io/downloads/${pkgname}-linux.zip")
md5sums=('43ce37e5f1515a4ae0aaab84c96cf318')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="${pkgdir}/" install
}

package() {
  cd "$srcdir"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"

  for F in *.pdf; do
    install -D -dm644 $F "${pkgdir}/usr/share/licenses/${pkgname}/"
  done

  cd "$srcdir"
  install -dm755 "${pkgdir}/opt/${pkgname}/"
  install -m755 ${_pkgname} "${pkgdir}/opt/${pkgname}/"

  install -dm755 ${pkgdir}/usr/bin/
  ln -sf ${pkgdir}/opt/${pkgname}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}
  chmod 755 ${pkgdir}/opt/${pkgname}/${_pkgname}
}