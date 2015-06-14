# Maintainer: BrainDamage
pkgname="openssl-af_alg-git"
pkgrel=1
pkgver=20150614.1851bbb
pkgdesc="af_alg is an openssl module which uses the kernel's AF_ALG crypto api to accelerate encryption"
arch=('x86' 'x86_64' 'armv6h' 'armv7h')
url="http://carnivore.it/2011/04/23/openssl_-_af_alg"
license=("custom:BSD")
depends=("openssl")
makedepends=("git")
provides=("openssl-af_al")
conflicts=("openssl-af_al")
optdepends=()
sha1sums=("SKIP" "84c9a31ac18aeea4fe1f72e870eef378ab92d8a7")
source=("git+git://git.carnivore.it/users/common/af_alg.git" "LICENSE")

pkgver() {
	cd "$srcdir/af_alg"
	#uuuugly code to use date + current git hash in lieu of absent release tag
	echo "$(date +%Y%m%d).$(git describe --always)"
}

build() {
	cd "$srcdir/af_alg"
	make
}

package() {
	cd "$srcdir/af_alg"
	install -D libaf_alg.so "$pkgdir/usr/lib/engines/libaf_alg.so"
	install -D -m644 README "$pkgdir/usr/share/doc/openssl-af_alg/README"
	install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/openssl-af_alg/LICENSE"
}