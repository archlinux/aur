# Maintainer: Yamashiro <dev cosmicheron com>

_pkgbase='udev-joystick-blacklist'
pkgname="${_pkgbase}-git"
pkgdesc="Fix for keyboards/mice/tablets being detected as game devices in Linux"
pkgver=r127.bb92e6e
pkgrel=1
url='https://github.com/denilsonsa/udev-joystick-blacklist'
arch=('any')
license=('Public Domain')
makedepends=('git')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${url}.git")
sha512sums=('SKIP')
options=('!debug' '!strip')

pkgver() {
    cd "$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	# Upstream recommended method of setting the permissions of erroneously detected gamepads to 0000
	install -Dm644 "${srcdir}/${_pkgbase}/after_kernel_4_9/51-these-are-not-joysticks.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks.rules"

	# Alternative methods (ONLY EVER USE ONE, COMMENT THE OTHER ONES OUT):
	# 1. If you would instead prefer to remove the the false gamepads instead uncomment the line below
	#install -Dm644 "${srcdir}/${_pkgbase}/after_kernel_4_9/51-these-are-not-joysticks-rm.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks-rm.rules"

	# 2. Permission rules but with added legacy rules that include Microsoft devices (there were patched in kernel 4.9)
	#install -Dm644 "${srcdir}/${_pkgbase}/51-these-are-not-joysticks.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks.rules"

	# 3. Removal rules but with added legacy rules that include Microsoft devices (these were patched in kernel 4.9)
	#install -Dm644 "${srcdir}/${_pkgbase}/51-these-are-not-joysticks-rm.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks-rm.rules"
}
