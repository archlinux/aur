# Maintainer: bb010g <bb010g@gmail.com>
# Co-maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=betterdiscord-rauenzi-git
pkgver=0.6.2.r43.gb44348d
pkgrel=1
pkgdesc="Discord extension with plugin support, emotes, and more (rauenzi's updated fork)"
arch=('any')
url='https://github.com/rauenzi/BetterDiscordApp'
license=('MIT')
depends=()
optdepends=('betterdiscordctl: BetterDiscord installation')
makedepends=('git')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+https://github.com/rauenzi/BetterDiscordApp.git#branch=injector")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/\s*"version": "\(.*\)",/\1/p' package.json)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/lib/"
  cp -r "${srcdir}/${pkgname%-git}" "${pkgdir}/usr/lib/${pkgname}"
  rm -rf "${pkgdir}/usr/lib/${pkgname}/.git"
}
