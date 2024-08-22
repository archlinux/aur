# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgbase=xsg-fonts
pkgname=(xsg-fonts-bdf xsg-fonts-otb xsg-fonts-pcf)
pkgdesc='Condensed terminal emulator Unicode bitmap font'
pkgver=0.2024.05.30
pkgrel=1
url=https://codeberg.org/nereusx/xsg-fonts
arch=(any)
license=(OFL-1.1)
makedepends=(fontforge git xorg-bdftopcf fonttosfnt)
_commit_id=df79d35911d8a63ced1f06ae4bff2e35e181bad6
source=("${pkgbase}-${pkgver}::git+${url}.git#commit=${_commit_id}" Makefile)
b2sums=('SKIP'
        '8c0cf64ecb1db6e30e5b0e50e7d6de4fbd96acbab351e9ca00921f645fc207728953b9eba6f59a2b445902351b331ab2671972852cfff96cf66f4675e0e80ece')

build ()
{
	cd "${pkgbase}-${pkgver}"
	make -f "${srcdir}/Makefile"
}

_package ()
{
	pkgdesc+=" (${pkgname##*-} format)"
	install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgbase}" "$@"
}

package_xsg-fonts-bdf ()
{
	cd "${pkgbase}-${pkgver}"
	_package *.bdf
}

package_xsg-fonts-otb ()
{
	cd "${pkgbase}-${pkgver}"
	_package *.otb
}

package_xsg-fonts-pcf ()
{
	cd "${pkgbase}-${pkgver}"
	_package *.pcf.gz
}
