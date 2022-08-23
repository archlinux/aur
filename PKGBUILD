# Maintainer: Abdelhak Bougouffa <abougouffa@fedoraproject.org>

pkgname=r-go-tools-led-git
pkgver=22.02.r0.g791a046
pkgrel=1
pkgdesc='Tool to control the special LED on R-Go Tools keyboards'
arch=(i686 x86_64)
url='https://uninformativ.de/git/r-go-tools-led'
license=(MIT)
depends=(xprintidle)
source=($pkgname::git+https://www.uninformativ.de/git/r-go-tools-led.git
        "90-r-go-led.rules")
sha256sums=('SKIP'
            'c76a6582a7e21f6de95cabb5a426fb00cba2519d265c7aa80279218b7a406040')
install=${pkgname}.install

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/v\(.*\)/\1/;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -Dm755 "${srcdir}/${pkgname}/r-go-led" "${pkgdir}/usr/bin/r-go-led"
  install -Dm755 "${srcdir}/${pkgname}/r-go-break-reminder" "${pkgdir}/usr/bin/r-go-break-reminder"
  install -Dm644 "${srcdir}/${pkgname}/r-go-led.1" "${pkgdir}/usr/share/man/man1/r-go-led.1"
  install -Dm644 "${srcdir}/${pkgname}/r-go-break-reminder.1" "${pkgdir}/usr/share/man/man1/r-go-break-reminder.1"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/90-r-go-led.rules" "${pkgdir}/usr/lib/udev/rules.d/90-r-go-led.rules"
}
