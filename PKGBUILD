# Maintainer: Adam <adam@atlas-sw.com>
pkgname=razer-fn-fix-git
pkgver=1.2.0
pkgrel=2
pkgdesc="JIT low-level hypershift key layer fix for Razer Keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/Adam-AtlasSoftware/razer-fn-fix"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'clang')
provides=('razer-fn-fix')
conflicts=('razer-fn-fix')
install=razer-fn-fix.install

source=("${pkgname}::git+https://github.com/Adam-AtlasSoftware/razer-fn-fix.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    gcc -O3 razer_driver.c cJSON.c -lm -o razer_driver
}

package() {
    install -Dm755 "$srcdir/${pkgname}/razer_driver" "$pkgdir/usr/bin/razer_driver"
    install -Dm644 "$srcdir/${pkgname}/razer-fn.service" "$pkgdir/usr/lib/systemd/system/razer-fn.service"
    install -Dm644 "$srcdir/${pkgname}/99-razer-input.rules" "$pkgdir/usr/lib/udev/rules.d/99-razer-input.rules"
}
