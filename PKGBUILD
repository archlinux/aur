# Maintainer: Ryan O'Beirne <ryanobeirne@gmail.com>

pkgname=xbox-generic-controller
pkgver=0.1.1
pkgrel=1
pkgdesc="Fix for generic XBox-like USB gamepads that are recognized but not functional"
arch=("any")
url="https://gitlab.com/ryanobeirne/xbox-generic-controller"
license=('MIT')
depends=("systemd" "python>=3" "python-pyusb" "xboxdrv" "python-systemd")

source=(
	$pkgname.conf
	50_$pkgname.rules
	fixcontroller.py
)

sha256sums=(
	bdc54ef5b9728751f89f08039c69141f7515b9df723cbda1df0239c5109d249b
	ecb8c515f1b88fe4986eec098bd6863c459c39fd569d759884936e39d22d586b
	b618d4286f7c70e2f02fce495cc7ba34ac31ad4a3350dd45387a81313bcad78d
)

package() {
	install -D "${source[0]}" "$pkgdir/etc/modprobe.d/${source[0]##*/}"
	install -D "${source[1]}" "$pkgdir/etc/udev/rules.d/${source[1]##*/}"
	install -D "${source[2]}" "$pkgdir/usr/bin/${source[2]##*/}"
}
