# Maintainer: Trevor Satori <trevor@satoridigital.co>
pkgname=satori-kronos-git 
pkgver=0.1.0.r88.64a4e7b
pkgrel=1
url="https://github.com/TrevorSatori/kronos.git"
pkgdesc="A Lightweight Terminal Music Player For Offline Listening"
arch=('x86_64')
url="https://github.com/TrevorSatori/kronos"
license=('GPL3')
depends=('alsa-lib') 
makedepends=('rust' 'cargo' 'git') 
provides=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')
name=kronos-git

pkgver() {
	cd $pkgname
	printf "%s.r%s.%s" "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		RUSTUP_TOOLCHAIN=stable cargo build --release --all-features --manifest-path=$pkgname/Cargo.toml --target-dir=target
}

package() {
	install -Dm755 "target/release/${name%-git}" -t "$pkgdir/usr/bin"
}
