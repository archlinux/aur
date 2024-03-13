# Maintainer: Heptazhou <zhou at 0h7z dot com>

pkgname_=libcurl-julia
pkgname=$pkgname_-bin
pkgver=1.10
pkgrel=1
pkgdesc="command line tool and library for transferring data with URLs - Julia fork"
arch=("x86_64")
url="https://julialang.org/"
license=("MIT")
provides=("$pkgname_")
conflicts=("$pkgname_")
depends=("julia")
options=(!debug)
source_="julia-$pkgver-latest-linux-x86_64.tar.gz"
source=("https://julialang-s3.julialang.org/bin/linux/x64/$pkgver/$source_"
	"$pkgname_-update.hook"
	"$pkgname_-remove.hook"
)
sha256sums=("SKIP"
	"fefa5ae85d68d5de385f16ac82fdebef3cda26eddbc3e78d7c7a52b69c64a462"
	"65a3ce6bb0ac3a9cff1128f75c024bd56bb5adc5e6c40fe5edb19278256e57aa"
)
# https://julialang-s3.julialang.org/bin/versions.json

package() {
	cd -- "$srcdir/julia"-*/

	mkdir "$pkgdir/usr/lib/julia/" -p
	cp -t "$pkgdir/usr/lib/julia/" -a "lib/julia/libcurl.so.4"*
	install -Dm644 -t "$pkgdir/usr/share/libalpm/hooks/" "$srcdir/$pkgname_"-*.hook
}
