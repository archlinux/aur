# Maintainer: rouhannb <rouhannb@gmail.com>
pkgname=fusee-launcher-git
pkgver=1.0.r0.g265e8f3
pkgrel=1
pkgdesc='work-in-progress launcher for one of the Tegra X1 bootROM exploits'
arch=('any')
url="https://github.com/Cease-and-DeSwitch/${pkgname%-git}"
license=('GPL2')
depends=('python-pyusb')
makedepends=('git' 'arm-none-eabi-gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Cease-and-DeSwitch/fusee-launcher.git' 'runner.sh')
md5sums=('SKIP' '1d81a0959d6f81c94caca58d3496ba7b')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# This isn't truly necessary, as fusee-launcher comes with a precompiled
# intermezzo.bin. Running makepkg with --nobuild should work fine.
build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/opt/${pkgname%-git}" "${pkgname%-git}.py"
    install -m644 -t "$pkgdir/opt/${pkgname%-git}" 'intermezzo.bin'
    install -D "$srcdir/runner.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
