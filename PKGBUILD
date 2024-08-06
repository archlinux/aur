# Maintainer: gcb <1705-gcb@users.noreply.gitlab.archlinux.org>
pkgname=dtui
pkgdesc='Small TUI for introspecting the state of the system/session dbus'
pkgver=2.0.0
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Troels51/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.gz::git+https://github.com/Troels51/${pkgname}.git#tag=v${pkgver}")
sha256sums=('6467ec552ea6a468841c9186599fe757f9e66380f45244cce37103cc3ed45a29')
pkgrel=1
arch=('x86_64')
url=https://github.com/Troels51/dtui
license=('MIT')
depends=() # dbus: application still only handle local bus...
makedepends=(rust)
optdepends=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname-$pkgver"
	cargo build --verbose
}

check() {
	cd "$pkgname-$pkgver"
	cargo test --verbose
}

package() {
	cd "$pkgname-$pkgver"
	install -o root -g root -m 0755 --preserve-timestamps target/debug/dtui /usr/bin/${pkgname}
}

