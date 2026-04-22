# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=tyggja
_pkgname=trackd
_appname=${_pkgname}
pkgname=${_appname}
pkgdesc="Track and undo any install command's filesystem changes"

pkgver=0.1.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust')
depends=('glibc' 'libgcc')

provides=("${_appname}")
conflicts=("${_appname}")

source=("${_pkgname}-${_pkgvername}.tgz::${url}/archive/${_pkgvername}.tar.gz"
		"LICENSE")
sha256sums=('9342baece1f88bfd5ad8796ec2f63ead8a68e444dcaa7e5fcb3f177fed7ec0e5'
            '664ff4cbe5fb3630e4cf7348c292c87c2a7671b23cb9b32ae62f9a628418785c')


build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "../LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
