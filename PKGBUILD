# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="lsd-print-git"
pkgver=r25.ce8621d
pkgrel=1
pkgdesc="Just a normal print tool, but we gave it lsd"
arch=("any")
url="https://github.com/SkwalExe/lsd-print"
license=('MIT')
makedepends=("git" "cargo")
provides=("lsd-print")
install=lsd-print.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd lsd-print
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd lsd-print
              
        # sudo rm -rf /usr/bin/lsd-print
}

build() {
	cd lsd-print
	cargo build --release
}


package() {
	cd lsd-print
        mkdir -p ${pkgdir}/opt/${pkgname}
        cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./target/release/lsd-print "$pkgdir/usr/bin/lsd-print"
        install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
