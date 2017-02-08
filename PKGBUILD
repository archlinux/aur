# Maintainer: Stefan Luecke <arch-aur@glaxx.net>

_pkgname=bumblebee-status
pkgname=bumblebee-status-git
pkgver=r292.188ee36
pkgrel=3
pkgdesc="A modular, theme-able status line generator for the i3 window manager."
arch=('any')
url="https://github.com/tobi-wan-kenobi/bumblebee-status"
license=('MIT')
depends=('python-netifaces' 'python-psutil')
optdepends=('xorg-xbacklight: To display a displays brightness'
	'xorg-xset: Enable/disable automatic screen locking'
	'libnotify: Enable/disable automatic screen locking'
	'dnf: Display DNF package update information'
	'xorg-seetxkbmap: Display/change the current keyboard layout'
	'redshift: Display the redshifts current color'
	'pulseaudio: Control pulseaudio sink/sources'
	'xorg-xrandr: Enable/disable screen outputs')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/tobi-wan-kenobi/bumblebee-status')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/${_pkgname}"
	install -m755 "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/"

	mkdir -p "${pkgdir}/usr/share/${_pkgname}/bumblebee"
	install -Dm644 "bumblebee/"*.py "${pkgdir}/usr/share/${_pkgname}/bumblebee/"

	mkdir -p "${pkgdir}/usr/share/${_pkgname}/bumblebee/modules"
	install -Dm644 "bumblebee/modules/"*.py "${pkgdir}/usr/share/${_pkgname}/bumblebee/modules/"

	mkdir -p "${pkgdir}/usr/share/${_pkgname}/themes"
	install -Dm644 "themes/"*.json "${pkgdir}/usr/share/${_pkgname}/themes/"

	mkdir -p "${pkgdir}/usr/share/${_pkgname}/themes/icons"
	install -Dm644 "themes/icons/"*.json "${pkgdir}/usr/share/${_pkgname}/themes/icons/"

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	mkdir -p "${pkgdir}/usr/bin"
	ln -rs "${pkgdir}/usr/share/${_pkgname}/bumblebee-status" "${pkgdir}/usr/bin/${_pkgname}"
}
