# Maintainer: bb010g <bb010g@gmail.com>
pkgname=betterdiscord-rauenzi-git
pkgver=0.2.82.r487.gf0d355e
pkgrel=1
pkgdesc="Discord extension with plugin support, emotes, and more (rauenzi's updated fork)"
arch=('any')
url='https://github.com/rauenzi/BetterDiscordApp'
license=('MIT')
depends=()
optdepends=('betterdiscordctl: BetterDiscord installation')
makedepends=('git')
install="${pkgname%-git}.install"
source=(
  "${pkgname%-git}::git+https://github.com/rauenzi/BetterDiscordApp.git#branch=stable16"
  'LICENSE'
)
md5sums=(
  'SKIP'
  '8414480728c5dc0d4ca9a93cfaf67acb'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/lib/"
  cp -r "${srcdir}/${pkgname%-git}" "${pkgdir}/usr/lib/${pkgname}"
  rm -rf "${pkgdir}/usr/lib/${pkgname}/.git"
}
