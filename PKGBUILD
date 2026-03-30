# Maintainer: BrainDamage

pkgname=leveldb-cli
pkgver=1.5.2
pkgrel=1
pkgdesc=" A command-line interface for LevelDB"
arch=('x86_64')
license=('MIT')
makedepends=('go')
url="https://github.com/cions/leveldb-cli"
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a8d2ff5ce2a7f6962137a2069b1a823bca4f9958cc1cd2f3c2f84856e8042fbd')

_basename="leveldb"
_dirname="${pkgname}-${pkgver}/cmd/leveldb"


build() {
	cd "${srcdir}/${_dirname}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"${LDFLAGS}\"" \
		-o "${_basename}" .
}

# template start; name=install_bin; version=1;
package() {
	cd "${srcdir}/${_dirname}"
	find . -mindepth 1 -type f -iname "${_basename}" -executable \
		-exec install -Dvm 755 -t "${pkgdir}/usr/bin" {} +
	find . -maxdepth 1 -iname 'README*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" {} +

}
