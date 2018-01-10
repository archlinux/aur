# Maintainer: bb010g <bb010g@gmail.com>
pkgname=betterdiscord-rauenzi-git
pkgver=0.2.82.r472.g247a6a9
pkgrel=1
pkgdesc="Discord extension with plugin support, emotes, and more (rauenzi's updated fork)"
arch=('any')
url='https://github.com/rauenzi/BetterDiscordApp'
license=('MIT')
depends=('asar' 'discord')
makedepends=('git')
source=(
  "${pkgname%-git}::git+https://github.com/rauenzi/BetterDiscordApp.git#branch=stable16"
  'betterdiscordctl'
  'LICENSE'
)
md5sums=(
  'SKIP'
  '09ff09dd39f4115da17f1da89c52e4df'
  '8414480728c5dc0d4ca9a93cfaf67acb'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 betterdiscordctl "${pkgdir}/usr/bin/betterdiscordctl"

  mkdir -p "${pkgdir}/usr/lib/"
  cp -r "${srcdir}/${pkgname%-git}" "${pkgdir}/usr/lib/${pkgname}"
  rm -rf "${pkgdir}/usr/lib/${pkgname}/.git"
  rm "${pkgdir}/usr/lib/${pkgname}/.gitignore"
}
