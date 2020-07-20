# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>

pkgname=yarntown
pkgver=1.0
pkgrel=1
pkgdesc="A Zeldalike tribute to Bloodborne. Explore the streets of a cursed, gothic town, hunting beasts and uncovering twisted bosses."
arch=('any')
url="https://maxatrillionator.itch.io/yarntown"
license=('custom')
groups=()
depends=('solarus>=1.6.0')
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MaxMraz/${pkgname}/releases/download/v${pkgver}/data.solarus"
        "https://github.com/MaxMraz/${pkgname}/raw/master/yarntown-web-assets/icon_128.png")
noextract=('data.solarus')
md5sums=('5d83861e91c525871332f4f8b949e11e'
        '1c40e5b7e722708b4bea87855e25876e')
_name="Yarntown"
_categories="Game;ActionGame"

prepare() {
  cd "${srcdir}"
  gendesk -f -n ../PKGBUILD
}

build() {
  cd "${srcdir}"
  echo -e "#!/bin/sh\nsolarus-run /usr/share/solarus/$pkgname/data.solarus $*" > $pkgname
}

package() {
  cd "${srcdir}"
  install -Dm0644 ./data.solarus "$pkgdir"/usr/share/solarus/$pkgname/data.solarus
  install -Dm0755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm0644 icon_128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

