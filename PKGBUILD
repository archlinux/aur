# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=codeberg-cli-git
pkgver=0.3.4.0a15b5e
pkgrel=2
pkgdesc='CLI Tool for Codeberg similar to gh and glab.'
arch=(x86_64)
url='https://codeberg.org/RobWalt/codeberg-cli'
license=(AGPL3)
depends=(gcc-libs openssl)
makedepends=(git rust)
provides=(codeberg-cli)
conflicts=(codeberg-cli)
source=(git+$url.git)
sha256sums=('SKIP')
md5sums=('SKIP')

pkgver() {
    cd "$provides"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)//;s/-/./g'
}

build() {
	cd "$provides"
	cargo build --all-features
}

package() {
	install -Dm755 "$srcdir/$provides/target/debug/berg" "$pkgdir/usr/bin/codeberg-cli"
}

