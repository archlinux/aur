# Maintainer: Krzysztof Kucharski <krzysztof85@gmail.com>
pkgname=esp8266-nonos-sdk
pkgver=3.0.6
pkgrel=2
pkgdesc="ESP8266 nonOS SDK extended with Python3 support, LED blink example, and improved Makefiles. See README for details."
arch=('x86_64')
url="https://github.com/espressif/ESP8266_NONOS_SDK"
license=('Espressif MIT')
depends=('python')
optdepends=('xtensa-lx106-elf-gcc-bin: Toolchain for the ESP8266')
makedepends=('git')
options=(!strip)
source=("https://github.com/espressif/ESP8266_NONOS_SDK/archive/v$pkgver.tar.gz"
	"py3_compat-led_blink-build_path_fix.patch")
sha256sums=('e07ea77ee6adaf172191d599a42bd5b8d047a3c4b890c1fab76dbbadf6a12c44'
			'7c4b685933ca81312bb8bad484a07f4f0b3f76b1810d0b417c6412f7cace5f22')
prepare() {
	cd ESP8266_NONOS_SDK-$pkgver
	patch --forward --strip=1 --input=../py3_compat-led_blink-build_path_fix.patch
}

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -af ESP8266_NONOS_SDK-$pkgver/* "$pkgdir"/opt/$pkgname
	install -Dm644 "../README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
