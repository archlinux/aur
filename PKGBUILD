# maintainer: libele <libele@disroot.org>
# http://advent.jenandcal.familyds.org/#RUSS0000

pkgname=advent
pkgver=0
pkgrel=6
pkgdesc="WELCOME TO ADVENTURE!!"
arch=('i386' 'x86_64')
url='http://www.russotto.net/~mrussotto/ADVENT/'
license=('none')
depends=('libf2c')
makedepends=('g77')

source=("https://www.ifarchive.org/if-archive/games/source/adv_crowther.zip")
md5sums=('705272719b0ddf0248385ec492ddbe51')

build() {
  cd "${srcdir}"/f77
  g77 -o advf4-11 -finit-local-zero advf4-11.f advsup.f
  g77 -o advf4-31 -finit-local-zero advf4-31.f advsup.f
}

package() {
  cd "${srcdir}"/f77
  install -Dm755 advf4-11 "${pkgdir}/usr/share/${pkgname}/advf4-11"
  install -Dm644 advdat11.dat "${pkgdir}/usr/share/${pkgname}/advdat11.dat"

  install -Dm755 advf4-31 "${pkgdir}/usr/share/${pkgname}/advf4-31"
  install -Dm644 advdat31.dat "${pkgdir}/usr/share/${pkgname}/advdat31.dat"

  cd "${srcdir}"
  echo '#!/bin/sh' > "${pkgname}".sh
  echo 'cd /usr/share/advent' >> "${pkgname}".sh
  echo './advf4-31' >> "${pkgname}".sh
  install -Dm755 "${pkgname}".sh "${pkgdir}/usr/bin/${pkgname}"
}
