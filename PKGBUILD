# Maintainer: Fabian Bornschein <plusfabi(At)gmail(Dot)com>
pkgname=game-devices-udev
pkgver=0.9
pkgrel=1
pkgdesc="Udev rules for controllers"
url='https://gitlab.com/fabis_cafe/game-devices-udev'
arch=('any')
license=('MIT')
depends=('udev')
makedepends=('git')
install="$(/usr/bin/tail -n 1 /usr/lib/os-release | /usr/bin/cut -d= -f2).install"
_commit=aa1b658433e6f28588bf93cb826267fe2aa93a99  # tags/0.9^0
source=("git+https://gitlab.com/fabis_cafe/game-devices-udev.git#commit=$_commit"
	"uinput.conf")
sha512sums=('SKIP'
            'a9b069ed121ffeee887e0583d8cb46035ecf1fa90a26a4ecb3aa11ff03178b2b08621f6676db6b2350f290694c04aabcf36f2ce3e0813a76dde9a33555edb112')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
	# install license
	install -Dm 644 "${srcdir}/${pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# install udev rules
	install -dm 755 "${pkgdir}/usr/lib/udev/rules.d"
	cp "${srcdir}/${pkgname}"/*.rules \
		"${pkgdir}/usr/lib/udev/rules.d/"

	# start uinput at boot
	install -Dm 644 "${srcdir}/uinput.conf" \
		"${pkgdir}/usr/lib/modules-load.d/uinput.conf"
}
