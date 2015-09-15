# Maintainer: Artem Bezsmertnyi <artem.bezsmertny@gmail.com>
pkgname=pacget
pkgver=0.1.0
pkgrel=0
pkgdesc="A script using the mirrors from /etc/pacman.d/mirrorlist for speeding up pacman"
arch=(any)
url="https://wiki.archlinux.org/index.php/Improve_pacman_performance"
license=('FREE')
depends=('aria2' 'pacman')
options=(!emptydirs)
install="pacget.install"
source=("improve_pacman_performance.wiki::https://wiki.archlinux.org/index.php/Improve_pacman_performance?action=raw"
        "pacget.install")
md5sums=('eff13d58f819ccc5ff1a428c6db7062a'
         '3eafc809dc489595c5afa03a12d1ef09')

build() {
  cd "${srcdir}"

  # Get all lines between {{hc|/usr/bin/pacget|<nowiki> and the following </nowiki>}}
  grep -ozP '(?s)\{\{hc\|\/usr\/bin\/pacget\|<nowiki>\n\K.*?(?=\n<\/nowiki>)' improve_pacman_performance.wiki > "${srcdir}/pacget"
  # Get all lines between {{hc|/etc/pacget.conf|<nowiki> and the following </nowiki>}}A
  grep -ozP '(?s)\{\{hc\|\/etc\/pacget.conf\|<nowiki>\n\K.*?(?=\n<\/nowiki>)' improve_pacman_performance.wiki > "${srcdir}/pacget.conf"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/etc"

  install -D -m 755 "${srcdir}/pacget" "${pkgdir}/usr/bin/pacget"
  install -D -m 644 "${srcdir}/pacget.conf" "${pkgdir}/etc/pacget.conf"
}
# vim:set ts=2 sw=2 et:
