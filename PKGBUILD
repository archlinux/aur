# Maintainer: TTsdzb <ttsdzb at outlook dot com>
# Maintainer: Jia Yin<yenfeng.shetiko at gmail dot com>

pkgname=hmcl-rc-bin
pkgver=3.12.4
pkgrel=2
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL-3.0-or-later')
depends=('java-runtime' 'hicolor-icon-theme')
provides=('hmcl')
conflicts=('hmcl')
source=("hmcl.desktop"
        "hmcl-launch-script"
        "${pkgname}-${pkgver}-${pkgrel}.jar::https://github.com/HMCL-dev/HMCL/releases/download/v${pkgver}/HMCL-${pkgver}.jar"
        "icon.png::https://github.com/HMCL-dev/HMCL/blob/main/HMCL/src/main/resources/assets/img/icon.png"
        "icon@2x.png::https://github.com/HMCL-dev/HMCL/blob/main/HMCL/src/main/resources/assets/img/icon@2x.png"
        "icon@4x.png::https://github.com/HMCL-dev/HMCL/blob/main/HMCL/src/main/resources/assets/img/icon@4x.png"
        "icon@8x.png::https://github.com/HMCL-dev/HMCL/blob/main/HMCL/src/main/resources/assets/img/icon@8x.png")
sha256sums=('904999db15ae0094dc364913f4aa14f500626bb6b50a37cc8c2090bb9f6ae385'
            'b11eca896b79e206a6991e82b82fb1e9a2a1e3e5ce04757114a37747213a76ab'
            '0b12ecdeb316fbe14617b595f443086feebd66b9d5d8c69d1070ff34cc97048c'
            '84035cd9a77b1ce24f1ac93a456509abc96db001b58843a9a933e9499cf17b1c'
            '29e75615e9f97ce90d1b456932a6a963fbfa73fcbaeb05c044bf3ddf9e279406'
            '5021a6076783a731a77f8655c36b185443a35d119a571b93b7f9ffd624bd1c51'
            'bd70644a5d5582b95587a067e85fb37bdb9111daf8ef2d96e4d76aa1d2d5081c')

noextract=("${pkgname}-${pkgver}-${pkgrel}.jar")

package() {
  install -Dm644 "${pkgname}-${pkgver}-${pkgrel}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # install icons
  local _icon _iconfile
  for _icon in 32:icon.png 64:icon@2x.png 128:icon@4x.png 256:icon@8x.png; do
    _iconfile=${_icon#*:}
    _icon=${_icon%:*}
    install -Dm644 "${_iconfile}" "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png"
  done
}
