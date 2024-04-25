# Maintainer: Skiftsu <skiftsu@gmail.com>
pkgname=quick-aliases
pkgver=0.1
pkgrel=1
pkgdesc="Quick Aliases is a utility allows to save complex or lengthy commands under a name"
arch=('x86_64')
url="https://github.com/Skiftsu/quick-aliases"
license=('MIT OR Apache-2.0')
makedepends=(cargo
             git)

source=("git+${url}.git")
sha256sums=("SKIP")

prepare() {
	cd ${pkgname}

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd ${pkgname}

	cargo build --release
}

package() {
	cd ${pkgname}

    install -D -m755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}

