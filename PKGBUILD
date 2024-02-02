# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

pkgname="systemd-yodad"
pkgver=1.0.0
pkgrel=3
pkgdesc="Plays the yoda death sound effect randomly"
arch=(any)
url="https://github.com/thatonecalculator/systemd-yodad"
license=('MIT')
depends=(
	systemd
	mpg123
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=(!makeflags !buildflags !strip)

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 yoda -t "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/yoda"
	install -Dm644 yodad.service "$pkgdir/usr/lib/systemd/system/yodad.service"
	install -Dm644 yoda.mp3 -t "${pkgdir}/usr/share/yoda/${_pkgname}"
	echo "pretty please systemctl enable --now yodad.service"
}
