# Maintainer: swweetp <swweetp@outlook.com>
pkgname=turing-smart-screen-python
pkgver=3.9.5
pkgrel=1
epoch=
pkgdesc="A Python system monitor program and an abstraction library for small IPS USB-C (UART) displays (Unofficial open-source alternative version)"
arch=('any')
url="https://github.com/mathoudebine/turing-smart-screen-python"
license=('GPL-3.0-or-later')
groups=()
depends=(
	python
	python-pyserial
	python-yaml
	python-psutil
	python-pystray
	python-babel
	python-ruamel-yaml
	python-sv-ttk
	python-tkinter-tooltip
	python-uptime
	python-requests
	python-ping3
	python-pillow
	python-numpy
	python-gputil
	bash
	tk
)
makedepends=()
checkdepends=()
optdepends=(
	'python-pyamdgpuinfo: Support for AMD GPUs'
)
provides=()
conflicts=()
replaces=()
backup=(
	"opt/$pkgname/config.yaml"
)
options=()
install="${pkgname}.install"
changelog=
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/mathoudebine/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname%-python}"
	"sysusers.conf"
	"tmpfiles.conf"
	"udev.rules"
)
noextract=()
sha256sums=('9fa62b9769e3c4db8cb4ec73831180b6f6b43ce35e1858c3a10af0304de2fad5'
            'e82a96a7a1fce673af864b9295df6c9c0c2c2ec07ea0ce8eb74910d232b33f6a'
            'e648b026686611231538e1e67d32c1d9879da47d427f0d34c13e870b154506cf'
            'fa172b5ab1fbcaaf8b6f21e9080d12e27333a99863680fd768789ba7bafb1ae2'
            '3d3749981af15fcdacda784a159c4970ca8c6316dedd2eab477939ac97071f2c')
validpgpkeys=()

package() {
	install -Dm755 "${pkgname%-python}" -t "$pkgdir/usr/bin/"
	
	install -dm755 "$pkgdir/usr/lib/sysusers.d/"
	install -Dm644 "sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname%-python}.conf"
	install -dm755 "$pkgdir/usr/lib/tmpfiles.d/"
	install -Dm644 "tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-python}.conf"
	install -Dm644 "udev.rules" "$pkgdir/usr/lib/udev/rules.d/65-${pkgname%-python}.rules"

	cd "$pkgname-$pkgver"
	install -dm755 "$pkgdir/opt/"
	cp -a . "$pkgdir/opt/$pkgname/"

	chmod 664 "$pkgdir/opt/$pkgname/config.yaml"
}
