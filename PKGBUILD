# Maintainer: Phantasm <phantasm@centrum.cz>
# Contributor: Tony Fettes <feihaoxiang2014@gmail.com>

pkgname=plasma6-themes-matcha-git
_gitname=Matcha-kde
pkgver=r11.a3b247b
pkgrel=1
pkgdesc='A flat Design theme for KDE Plasma desktop'
arch=('any')
url='https://github.com/vinceliuice/Matcha-kde'
license=('GPL-3.0-only')
optdepends=('plasma-desktop: Plasma desktop themes'
            'qogir-icon-theme: Recommended icon themes'
	    'kvantum: Kvantum application style')
makedepends=('git')
provides=('matcha-kde' 'plasma6-themes-matcha-git')
conflicts=('matcha-kde')
replaces=('plasma5-themes-matcha-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_gitname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}/${_gitname}
	install -dm755 "${pkgdir}/usr/share/aurorae/themes"
	cp -r aurorae/Matcha-sea "${pkgdir}/usr/share/aurorae/themes"
	install -dm755 "${pkgdir}/usr/share/color-schemes"
	cp -r color-schemes/*.colors "${pkgdir}/usr/share/color-schemes"
	install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
	cp -r plasma/desktoptheme/Matcha-sea "${pkgdir}/usr/share/plasma/desktoptheme"
	cp color-schemes/MatchaSeaDark.colors \
		"${pkgdir}/usr/share/plasma/desktoptheme/Matcha-sea/colors"
	install -dm755 "${pkgdir}/usr/share/plasma/look-and-feel"
	cp -r plasma/look-and-feel/com.github.vinceliuice.Matcha-sea \
		"${pkgdir}/usr/share/plasma/look-and-feel"
	install -dm755 "${pkgdir}/usr/share/wallpapers/Matcha"
	cp -r wallpaper/*.jpg "${pkgdir}/usr/share/wallpapers/Matcha"
	install -dm755 "${pkgdir}/usr/share/Kvantum"
	cp -r Kvantum/* "${pkgdir}/usr/share/Kvantum"
}
