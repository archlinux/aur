pkgname='sigmavpn'
pkgver='0.3alpha2'
pkgrel='1'
pkgdesc='Light-weight, secure and modular VPN solution'
url=https://github.com/neilalexander/sigmavpn/
license=(BSD-2-Clause)
depends=(glibc libsodium)
makedepends=(meson)
arch=(x86_64 i686 arm)
source=(
	"${url}/archive/${pkgver}.tar.gz"
	fix-paths.patch
	meson.build
	sigmavpn.conf
)
sha512sums=('8f2e0ccf3c2a37288b3fb9dbf37349f3b7340a391af55af61acd4243d2915f5ce92932b2d5da509aa1328f3d55d06f1c36bc3ace03f5971d2578b4a5b9b0c09d'
            'f545a783fc93b5e6d640781ea3494f4845ac722304aff72bca0e153eed9646a498f52afb006485a6c733f177ab05382d25c250b0d9d91a3f82a6e80ef57b698d'
            'd55e2e49555bb0931ed453f9e6401da42aa86ac99e38fd5059f1048f5e8aad2c3c5a440fa61b5e1065efd9c7a3e9e7dcf6cb6d60779c3cc68222792155ea4e53'
            'e08ca11165ba4635f6fc713fa7109bade00fcddd85b6d3e0924f8455f84e51c65bd7d25aff09935919949accc2e554c0158837d1afd6ae52090df753a997f727')

prepare () {
	cd "$pkgname-$pkgver"
	patch -p0 < "$srcdir/fix-paths.patch"
	cp -v "$srcdir"/{meson.build,sigmavpn.conf} .
}

build () {
	rm -rf _build
	arch-meson _build "$pkgname-$pkgver"
	meson compile -C_build
}

package () {
	meson install -C_build --destdir="$pkgdir"
}
