# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=codeberg-cli-git
pkgver=r0.1.0.6.ge11d632
pkgrel=1
pkgdesc='CLI Tool for Codeberg similar to gh and glab.'
arch=(x86_64)
url='git+https://codeberg.org/RobWalt/codeberg-cli'
license=('AGPL3')
makedepends=('rust' 'cargo')
provides=('codeberg-cli')
conflicts=($pkgname)
source=($url)
md5sums=('SKIP')

pkgver() {
	cd "$provides"
	git describe --long --tags | sed 's/^v//;s/\([^⁻]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$provides"
	cargo build 
}

package() {
	cd "$srcdir"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$provides/target/debug/cod"
}

