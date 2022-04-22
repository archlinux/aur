# Maintainer: Stezko <stezko@gmail.com>
pkgname=dark-icon-theme-git
_pkgname=DarK-svg
pkgver=r84.22fce9e7
pkgrel=3
pkgdesc="DarK is a monotone icon theme for X11-themes it can also be used as a fallback icon theme. Add papirus telegram icons"
arch=('any')
url="https://gitlab.com/sixsixfive/DarK-icons"
license=('CC BY-SA 4.0')
depends=('gtk-update-icon-cache')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"git+https://gitlab.com/sixsixfive/DarK-icons.git"
	"telegram16.svg::https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/16x16/panel/telegram-panel.svg"
	"telegram22.svg::https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/22x22/panel/telegram-panel.svg"
	"telegram24.svg::https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/Papirus/24x24/panel/telegram-panel.svg"
	)
sha256sums=(
	    'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
	    )
install="$pkgname.install"

pkgver() {
	cd "${srcdir}/DarK-icons"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/DarK-icons/"
   chmod +x build_svg.sh
   ./build_svg.sh
        #add Papirus telegram icons
        #16x16
        tee ${srcdir}/DarK-icons/${_pkgname}/16x16/pool/telegram.svg ${srcdir}/DarK-icons/${_pkgname}/16x16/pool/im-telegram.svg < ${srcdir}/telegram16.svg >/dev/null
        #22x22
        tee ${srcdir}/DarK-icons/${_pkgname}/22x22/pool/telegram.svg ${srcdir}/DarK-icons/${_pkgname}/22x22/pool/im-telegram.svg < ${srcdir}/telegram22.svg >/dev/null
        #24x24
        tee ${srcdir}/DarK-icons/${_pkgname}/24x24/pool/telegram.svg ${srcdir}/DarK-icons/${_pkgname}/24x24/pool/im-telegram.svg < ${srcdir}/telegram24.svg >/dev/null
        #32x32
        tee ${srcdir}/DarK-icons/${_pkgname}/32x32/pool/telegram.svg ${srcdir}/DarK-icons/${_pkgname}/32x32/pool/im-telegram.svg < ${srcdir}/telegram24.svg >/dev/null
        #44x44
        tee ${srcdir}/DarK-icons/${_pkgname}/44x44/pool/telegram.svg ${srcdir}/DarK-icons/${_pkgname}/44x44/pool/im-telegram.svg < ${srcdir}/telegram24.svg >/dev/null
        #48x48
        tee ${srcdir}/DarK-icons/${_pkgname}/48x48/pool/telegram.svg ${srcdir}/DarK-icons/${_pkgname}/48x48/pool/im-telegram.svg < ${srcdir}/telegram24.svg >/dev/null
}
package() {

  cd "${srcdir}/DarK-icons/"
   mkdir -p "${pkgdir}/usr/share/icons/"
   cp -a "${_pkgname}/" "${pkgdir}/usr/share/icons/"
   install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
