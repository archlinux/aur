# Maintainer:  moviuro <moviuro+archlinux@gmail.com>

pkgname=mkmm
pkgver=0.4.0
pkgrel=1
pkgdesc="Moviuro's Kernel Module Manager"
arch=('any')
license=('MIT')
url="https://git.sr.ht/~moviuro/${pkgname}"
install="${pkgname}.install"
makedepends=('git')
validpgpkeys=('2CD96FEE343C6799B9CEAFAD62009A2E0C22D9AB')
# https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x62009A2E0C22D9AB
source=("git+${url}?signed#tag=${pkgver}"
        "${pkgname}.install")
sha256sums=('SKIP'
            '681d23e0770c4a73b27da5017bbe37c3cf922dec4d9b3a46048ff1e58b15b694')

package() {
  install -Dm 555 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/${pkgname}/"*hook
  install -Dm 444 "${srcdir}/${pkgname}/${pkgname}-bleach.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-bleach.service"
  install -Dm 444 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/Readme.md"
  install -dm 755 "${pkgdir}/usr/lib/${pkgname}"

  # Opinionated install
  install -Dm 444 -t "${pkgdir}/usr/share/libalpm/hooks" "${srcdir}/${pkgname}/"*tmpfs*hook
}

