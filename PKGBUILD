# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
_pkgname=mkinitcpio-colors
pkgname=${_pkgname}-git
pkgdesc="mkinitcpio hook to set VT console colors during early userspace"
license=('MIT')
url="https://github.com/evanpurkhiser/${_pkgname}"
pkgver=26.f0a18fb
pkgrel=1

source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')
install="usage.install"
depends=('mkinitcpio' 'setcolors-git')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('any')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -Dm 644 hooks/colors "${pkgdir}/usr/lib/initcpio/hooks/colors"
	install -Dm 644 install/colors "${pkgdir}/usr/lib/initcpio/install/colors"
	install -Dm 644 install/sd-colors "${pkgdir}/usr/lib/initcpio/install/sd-colors"

	install -Dm 644 setcolors.service "${pkgdir}/usr/lib/systemd/system/setcolors.service"

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
