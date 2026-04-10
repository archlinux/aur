# Maintainer: TTsdzb <ttsdzb at outlook dot com>
# Maintainer: Jia Yin<yenfeng.shetiko at gmail dot com>

pkgname=hmcl-beta-bin
pkgver=3.13.0.339
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
sha256sums=('ef5edb4285293c77162374e15f01f3540c7f511f6d9ab5b7244c4b01eb8512de'
            '296914106dac2d07c9ce2bc92a91568830534332e9bf7554ea591f22efa357df'
            '9ba8de88261fab281ba017c5596b63bb871c6ef029981c557673b0b6aec0d2ce'
            'd8293e012941c08ab0f9f21c803ebbd7e7de2498a0dc75eeb2b17a718fb389d2'
            '2b5a5fa9033f524d06dfcbb1ca3ce2b4d4ec87e90d626a8956e3b8141cb075fc'
            '76ef1d81982bfaffc8ce9143a6c11516e4d1aa0bd7283e9185f561e458f5da75'
            'ed0aa74dc0deb3d3ebb0801376c2d153d1989537ab39deb8a81b7eb33b0f52a6')

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
