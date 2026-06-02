# Maintainer: Adam <adam@atlas-sw.com>
pkgname=razer-fn-fix-git
pkgver=1.0.0
pkgrel=1
pkgdesc="JIT low-level hypershift key layer fix for Razer Keyboards."
arch=('x86_64' 'aarch64')
url="https://github.com/Adam-AtlasSoftware/razer-fn-fix"
license=('GPL3')
depends=('glibc')
makedepends=('gcc' 'clang')
provides=('razer-fn-fix')
conflicts=('razer-fn-fix')

source=("${pkgname}::git+https://github.com/Adam-AtlasSoftware/razer-fn-fix.git"
        "razer-fn.service::https://raw.githubusercontent.com/Adam-AtlasSoftware/razer-fn-fix/master/razer-fn.service")
sha256sums=('SKIP' 'SKIP')

build() {
    cd "$srcdir/${pkgname}"
    gcc -O3 razer_driver.c -o razer_driver
}

package() {
    install -Dm755 "$srcdir/${pkgname}/razer_driver" "$pkgdir/usr/bin/razer_driver"

    install -Dm644 "$srcdir/razer-fn.service" "$pkgdir/usr/lib/systemd/system/razer-fn.service"
}