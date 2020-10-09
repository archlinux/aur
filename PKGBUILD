# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=sysmon-git
pkgver=0.9.r19.g3085ac8
pkgrel=1
pkgdesc="Graphical system monitor. Similar to windows task manager."
arch=('any')
url="https://github.com/MatthiasSchinzel/sysmon"
license=('none')
depends=('python-pyqtgraph' 'python-pyqt5' 'wireless_tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/MatthiasSchinzel/sysmon.git'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '3f692c5a3cb16bcc2fa95c7b18392d45e4c08d575fcab8590679efcdb56b70ac'
            '4695bfb1a3305725b3f575bcba9fac88aa1c1c828439d3bb2008c7f008938a32')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i '1s/^/#!\/usr\/bin\/env python\n/' "src/${pkgname%-git}.py"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 src/{*.py,*.ui} -t "$pkgdir/opt/${pkgname%-git}"
	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
}
