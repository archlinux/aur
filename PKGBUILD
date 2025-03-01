# Maintainer: Mohamed Feddad <mrf345@gmail.com>

pkgname=safelock-git
pkgver=r58.6d06f40
pkgrel=1
pkgdesc="Fast drag & drop cross-platform files encryption tool (chacha20poly1305 + argon2id)"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://github.com/mrf345/safelock/"
license=('MPL-2.0')
source=("git+$url")
depends=('glibc')
makedepends=('wails')
provides=("safelock")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    wails build
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 build/bin/safelock "$pkgdir/usr/bin/safelock"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
