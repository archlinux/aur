# Maintainer: Ryan O'Beirne <ryanobeirne@ryanobeirne.com>

pkgname=xbox-generic-controller
pkgver=0.1.2
pkgrel=1
pkgdesc="Fix for generic XBox-like USB gamepads that are recognized but not functional"
arch=("any")
url="https://gitlab.com/ryanobeirne/xbox-generic-controller"
license=('MIT')
depends=("systemd" "python>=3" "python-pyusb" "python-systemd" "xboxdrv")
install=xbox-generic-controller.install

source=(
	$pkgname.conf
	50_$pkgname.rules
	fixcontroller.py
	$pkgname.install
)

sha256sums=(
	bdc54ef5b9728751f89f08039c69141f7515b9df723cbda1df0239c5109d249b
	ecb8c515f1b88fe4986eec098bd6863c459c39fd569d759884936e39d22d586b
	d709c20ff399be6e3dd26c762763a07ea8fcf96349477abfa0ae080526d86dbf
	f96288ed8d715548872b44cbc7fe19c5f29ff6a41b0b284f5fad7da21499bdb4
)

package() {
	install -Dm644 "${source[0]}" "$pkgdir/etc/modprobe.d/${source[0]##*/}"
	install -Dm644 "${source[1]}" "$pkgdir/etc/udev/rules.d/${source[1]##*/}"
	install -Dm755 "${source[2]}" "$pkgdir/usr/bin/${source[2]##*/}"
}
