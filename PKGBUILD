# Maintainer: gcb <1705-gcb@users.noreply.gitlab.archlinux.org>
pkgname=dtui
pkgdesc='Small TUI for introspecting the state of the system/session dbus'
pkgver=1.0.0
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Troels51/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.gz::git+https://github.com/Troels51/${pkgname}.git#tag=v${pkgver}")
sha256sums=('c5f1fcdc4e1982404160fbae8327fe75f588f558da9e3e1f16ea5b95e7ad1bc8')
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
	install -o root -g root -m 0755 --preserve-timestamps target/debug/dterm /usr/bin/${pkgname}
}

