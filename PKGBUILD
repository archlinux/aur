# Maintainer: Can Celasun <can[at]dcc[dot]im>

pkgname=paradox-launcher
pkgver=1.0
pkgrel=3
pkgdesc="Paradox Interactive Game Launcher"
arch=('x86_64')
url="https://play.paradoxplaza.com/"
license=('custom')
depends=("libxi" "xdg-utils" "freetype2" "libgl" "gconf")
source=(${pkgname}-${pkgver}.zip::http://launcher.paradoxplaza.com/linux_launcher
        ${pkgname}
        ${pkgname}.desktop)
sha256sums=('7b20c104d20daf418cd479275de0df1d3f4e08fa36faf6aba08ea0a321aeeaa5'
            '481ead5d9a16b532c93589c036a44b41ca7d85193c0f0158fc5ec957fc1e2c46'
            '6687c73d211ae7e50a1658e7dd7900a5f5777fe54df3a89e4f96a5b8dc210a11')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}"/opt/${pkgname}
  mkdir -p "${pkgdir}"/usr/bin
  cp -R "${srcdir}"/data/ "${pkgdir}"/opt/${pkgname} -R

  install -m644 -D "${pkgdir}/opt/${pkgname}/data/desktop/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m644 -D "${pkgdir}/opt/${pkgname}/data/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -m755 -D "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
