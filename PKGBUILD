# Maintainer: mia <mia@mia.jetzt>
pkgname=opendoas-retry
pkgver=6.8.2
pkgrel=1
pkgdesc='Run commands as super user or another user, with retries'
arch=(x86_64 i686)
url=https://github.com/Duncaen/OpenDoas
license=(custom:ISC)
depends=(pam)
provides=(opendoas doas)
conflicts=(opendoas)
source=("$pkgname::git+$url.git#tag=v$pkgver" "retry.patch")
sha256sums=("43b4c2de1aaa31aac1d322b98883334b864c606783c4dfb3ddbfa0d88af9332b" "SKIP")

prepare() {
	cd "$pkgname"
	patch -p1 <../retry.patch
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr --with-timestamp
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
