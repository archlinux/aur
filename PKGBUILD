# Maintainer: katt <magunasu.b97@gmail.com>

_pkgname=NEET_Girl_Date_Night
pkgname=neet-girl-date-night
pkgver=1.1
pkgrel=1
pkgdesc='A small visual novel of Kara Eklund'
arch=(any)
url=https://hitsujigoods.itch.io/ngdn
license=(custom:unknown)
depends=(renpy)
makedepends=(itchio-dlagent)
source=("${pkgname}-${pkgver}.zip::itch://hitsujigoods/ngdn/6693521")
sha256sums=('93146d2f7ac2f15bc7acb81d826e337ebb4c8b5054cea4d4526dbbc2fe2aa543')
DLAGENTS+=("itch::/usr/bin/itchio-dlagent %u %o")

package() {
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -r "${_pkgname}-${pkgver}-win/game" "${pkgdir}/usr/share/${pkgname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << END
#!/usr/bin/env sh
renpy /usr/share/${pkgname}
END

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << END
[Desktop Entry]
Name=${_pkgname//_/ }
Comment=${pkgdesc}
Exec=${pkgname}
Terminal=false
Categories=Game;
Type=Application
Icon=${pkgname}
END
	install -Dm644 "${_pkgname}-${pkgver}-win/game/gui/window_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
