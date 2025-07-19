# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=nekoray-mahdi-zarei-bin
_pkgname=${pkgname//-mahdi-zarei-bin/}
pkgver=4.3.7
pkgrel=2
_releasedate=2025-07-08
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box) - Mahdi-zarei fork [Outdated]"
arch=('x86_64')
url="https://github.com/Mahdi-zarei/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'libnotify')
optdepends=('qt6-wayland: to run application in a Wayland session')
conflicts=('nekoray' 'nekoray-git' 'nekoray-bin')
options=(!debug)

source=(
  "${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-${_releasedate}-linux64.zip"
  "${_pkgname}.desktop"
  "${_pkgname}.sh"
)

sha256sums=('68054a98247a0dfe5618aa7762d44404ac859e1c9c447a806b7e41172eff7f6b'
            'a98a4e84b782171edb8b84d1a0208b5bb68e31af7aa85cb9f3b6d9439473452d'
            '063e2705d6b7f759a3178495e0336295c9d375b3c4ef17e49e93aca4170012f3')

package() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/${_pkgname}/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

  install -Dt ${pkgdir}/usr/lib/${_pkgname}/ -m755 ./${_pkgname}/nekobox_core
  install -Dt ${pkgdir}/usr/lib/${_pkgname}/ -m755 ./${_pkgname}/nekoray
  install -Dm755 ./${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}

  install -Dt ${pkgdir}/usr/share/applications/ -m644 ./${_pkgname}.desktop
  install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./${_pkgname}/nekobox.png
}

