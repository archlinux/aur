# Maintainer: Yamashiro <dev@cosmicheron.com>

pkgname='udev-joystick-blacklist-git'
pkgdesc="Fix for keyboards/mice/tablets being detected as joysticks in Linux"
pkgver=r123.d7c2370
pkgrel=1
url='https://github.com/denilsonsa/udev-joystick-blacklist'
arch=('x86_64' 'aarch64')
license=('Public Domain')
makedepends=('git')
provides=("${pkgname%'-git'}")
conflicts=("${pkgname%'-git'}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm644 "${srcdir}/${pkgname}/51-these-are-not-joysticks-rm.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks-rm.rules"
	## Alternatively, if you don't want to remove the erroneous
	## devices but set their permissions to 0000, comment the above
	## line and uncomment the one below
	# install -Dm644 "${srcdir}/${pkgname}/51-these-are-not-joysticks.rules" "${pkgdir}/usr/lib/udev/rules.d/51-these-are-not-joysticks.rules"
}
