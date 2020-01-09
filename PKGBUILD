# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=gtk-theme-plano
_pkgname=plano-theme
_pkgauthor=lassekongo83
pkgver=3.34.2
pkgrel=1
pkgdesc='flat GTK+ theme'
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL3')
depends=('gtk-engines')
optdepends=('ttf-roboto: for the GNOME shell theme'
            'gtk-engine-murrine: for the GTK2 theme')
conflicts=('gtk-theme-plano-git')
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/lassekongo83/${_pkgname}/archive/v${pkgver/%.2/-2}.tar.gz)
sha256sums=('d94556d38b52f0444f712ddd8356e9b7a5338c95c79bd6203e328e15be1214ed')


package() {
	install -d "${pkgdir}"/usr/share/themes/Plano

	for file in index.theme gnome-shell gtk-2.0 gtk-3.0 openbox-3 xfwm4
	do
		cp -R "${srcdir}/${_pkgname}-${pkgver/%.2/-2}/${file}" "${pkgdir}"/usr/share/themes/Plano
	done

	# fix permissions and ownership
	find "${pkgdir}"/ -type d -exec chmod 755 '{}' \;
	find "${pkgdir}"/ -type f -exec chmod 644 '{}' \;
	chown -R root.root "${pkgdir}"/*
}
