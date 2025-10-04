# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrold-bin
_pkgname="${pkgname%-bin}"
pkgver=3.0.1
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices: daemon (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'libdrm'
	'gcc-libs'
	'glibc'
)
optdepends=(
	'nvidia-utils: NVIDIA GPU support'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname"
	"coolercontrol-liqctld"
)
groups=(coolercontrol-bin)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
	"https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '93329dcee55da4b9277500a40ae9cab78bf75764b84b6357c1de2a2307800ce1'
  '09f6384a22bcc84dda4502d040e1bce51279fe38c911f0006bab253e5ff74d24'
)

check() {
	chmod +x "./${_pkgname}_${pkgver}"
	"./${_pkgname}_${pkgver}" --version
}

package() {
	install -DTm755 "./${_pkgname}_${pkgver}" "$pkgdir/usr/bin/${_pkgname}"

	cd "${srcdir}/${pkgname%d-bin}-$pkgver"

	# systemd service file
	install -Dm644 "packaging/systemd/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"

	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
