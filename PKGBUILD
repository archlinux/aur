# Maintainer: Rustam Aliyev <ru5j4r0@google.com>
pkgname=pyflow-git
_pkgname=${pkgname%-git}
pkgver=0.2.5.1.r6.dc0ed92
pkgrel=1
pkgdesc="An installation and dependency system for Python"
arch=('x86_64' 'i686')
url="https://github.com/David-OConnor/pyflow"
license=('MIT')
depends=('xz')
makedepends=('cargo' 'git')
checkdepends=('cargo')
changelog=CHANGELOG.md
source=("git+https://github.com/David-OConnor/pyflow.git")
b2sums=('SKIP')
validpgpkeys=(B3D4420410BC16F84C358DF6AF36488D565A347A)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	cargo build --release --locked
}

check() {
	cd $_pkgname
	cargo test --release --locked
}

package() {
	cd $_pkgname
	install -Dt "$pkgdir/usr/bin" target/release/pyflow
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
