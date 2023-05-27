# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

_pkgname='quikc'
pkgname='quikc-git'
pkgver='1.0.0'
pkgrel='1'
url="https://github.com/Ramenu/$_pkgname"
pkgdesc='A minimalistic, safety-focused build system for C/C++'
arch=('x86_64')
makedepends=('cargo' 'git')
depends=('python')
license=('MIT')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

build() {
	cd "$_pkgname"
	export rustc_version=$(rustc --version)
	RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package() {
	cd "$_pkgname"
	install -Dm755 ./target/release/quikc -t "$pkgdir/usr/bin/"
	install -Dm755 ./quikc-init -t "$pkgdir/usr/bin/"
}

