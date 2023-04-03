# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

pkgname='quikc'
pkgver='0.5.3'
pkgrel='1'
url="https://github.com/Ramenu/$pkgname"
pkgdesc='A minimalistic, safety-focused build system for C/C++'
arch=('x86_64')
makedepends=('cargo')
license=('MIT')
source=("https://github.com/Ramenu/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9818f42a3888b75160de6c0d32a7e0b6361f5dd1c6a2210a41ba99b5c57aaddd17aa10d1034d91807c455dcc3f374addf115e2ceb67b79697f8e489c62e290df')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export rustc_version=$(rustc --version)
	RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./target/release/quikc -t "$pkgdir/usr/bin/"
	install -Dm755 ./quikc-init -t "$pkgdir/usr/bin/"
}

