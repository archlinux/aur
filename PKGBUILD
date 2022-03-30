# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="typrint-git"
pkgver=r15.b4da723
pkgrel=1
pkgdesc="Print text with a typing effect - Made with rust"
arch=('any')
url="https://github.com/SkwalExe/typrint"
license=('MIT')
makedepends=("git" "cargo")
provides=("typrint")
install=typrint.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd typrint
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd typrint
}

build() {
	cd typrint
	cargo build --release 
}


package() {
	cd typrint
	mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./target/release/typrint "$pkgdir/usr/bin/typrint"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
