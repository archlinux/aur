pkgname=hmcl-pr-bin
pkgver=3.6.unofficial_ad602ae
_pkgver=3.6.unofficial-ad602ae
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular | PR Collection"
arch=('any')
url="https://github.com/burningtnt/HMCL"
license=('GPL-3.0-or-later')
depends=('java-runtime' 'hicolor-icon-theme')
conflicts=('hmcl' 'hmcl-bin' 'hmcl-dev-bin' 'hmcl-beta-bin')
source=("hmcl-pr.desktop"
        "hmcl-pr-launch-script"
        "${pkgname}-${_pkgver}-${pkgrel}.jar::https://alist.8mi.tech/d/mirror/HMCL-Snapshot/Auto/6eca40e4c4f0a33343a9fb76819bae57caf30cb8/HMCL-${_pkgver}.jar")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

noextract=("${pkgname}-${_pkgver}-${pkgrel}.jar")

prepare() {
  # extract icons from jar
  # Thanks to @Misaka13514
  local _iconfile
  for _iconfile in icon.png icon@2x.png icon@4x.png icon@8x.png; do
    jar -xf "${pkgname}-${_pkgver}-${pkgrel}.jar" "assets/img/${_iconfile}"
  done
}

package() {
  install -Dm644 "${pkgname}-${_pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755 "hmcl-pr-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl-pr.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # install icons
  local _icon _iconfile
  for _icon in 32:icon.png 64:icon@2x.png 128:icon@4x.png 256:icon@8x.png; do
    _iconfile=${_icon#*:}
    _icon=${_icon%:*}
    install -Dm644 "assets/img/${_iconfile}" "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png"
  done
}
