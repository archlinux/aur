# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Upstream repository is missing tags:
# https://github.com/speedata/publisher/issues/550
_sha=7d1037fdd9b002ba53c8352d8ef67b7e552f3599

pkgname=speedata-publisher
pkgver=4.15.19
pkgrel=0
pkgdesc='a database publishing software that creates high-quality layouted PDFs fully automatically'
arch=(x86_64)
url='https://github.com/speedata/publisher'
license=(AGPL3)
depends=(glibc)
makedepends=(go
             lua
             ruby-rake)
_archive="${pkgname#*-}-$_sha"
source=("$url/archive/$_sha/$_archive.tar.gz")
sha256sums=('634ea7abecec41c83d3e7c5cce81a1be22e7e81dbb0b01610810dc89230237d0')

prepare() {
	cd "$_archive"
	# sed -i \
	#         -e '/^installdir/s!__FILE__!"/usr/bin"!' \
	#         -e '/^srcdir/as!"src"!"share/speedata"!' \
	#         Rakefile
}

build() {
	cd "$_archive"
	rake build
	rake buildlib
}

package() {
	cd "$_archive"
	# Upstream project has no installation targets
	# https://github.com/speedata/publisher/issues/551
	# rake install
	install -Dm0755 -t "$pkgdir/usr/bin/" bin/sp
}
