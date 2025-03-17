# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
__commit="469d378f9a097dca5f4a44e2c54192cef39b3a96"
pkgver=0.8.7
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files (binary version)"
arch=('x86_64')
license=('LGPL-3.0-only')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(glibc gcc-libs zlib libzip openssl)
makedepends=()
conflicts=(gourou-git gourou gourou-appimage)
provides=("gourou=${pkgver}")
options=(!strip)
__commit_link="https://forge.soutade.fr/soutade/${__pkgname}/raw/commit/${__commit}/"
__man_link="${__commit_link}/utils/man/"
source=(
	"https://forge.soutade.fr/api/packages/soutade/generic/${__pkgname}/${pkgver}/libgourou_utils_${pkgver}.tgz"
	"$__man_link/acsmdownloader.1"
	"$__man_link/adept_activate.1"
	"$__man_link/adept_loan_mgt.1"
	"$__man_link/adept_remove.1"
    "$__commit_link/utils/LICENSE"
)
sha512sums=(
        2227934de3ecfa46d6d46711d144d96d4680f57ebaa096839c480a4ed1e3e2f1be460633b3eda2b58c86485274a5b329d29f68d952bed41d8c2c10516e95b30b
        9cfaafb8ba99bf42713c9a99fd26d5a5b5f027e2fee1eba4e86f5161e1a8256ef691fbb135bd19b7ff9118eab89fc1a365e5ffc8fe9ef6cf080eec757ddd32b9
        b3cceb1ac60bedf75628c9cac56e2d246abe9378e58f959352b7ce133fabead3900f6ac3ccfa78f1163a923334ab6f724f77a2007144cd775aa45816a3398a51
        724e4c11491ca428995e3dfebf439a2a941b28b8cf08f5fa4fad93e3860196c21fe26962201bcc00d8875a970e3d7e321ebdf1b332157bb0fc920124dd12b42c
        cc99595cffc1f6882bd52525086947aa9356175cf00329b0c98cd9fd102a75595119dde8d2179b9478ce7777a42255f52998c00ad29d8556e3a130b618aa5e9a
        dd35b1dfd86efd7ea783b0d0c84e457991416ea986610494b32301188f4fd857df6610ae7d94759a1328536f75ff8764a5eb6a08f4965699ff3a8fd166dda725
)

package() {
	install -d "$pkgdir"/{usr/bin/,usr/lib/,/usr/share/man/man1/}

	cd "$srcdir"

	install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cp --no-preserve=ownership acsm*.1 adept*.1 "$pkgdir"/usr/share/man/man1/
	gzip -9 "$pkgdir"/usr/share/man/man1/*

	cd "${__pkgname}_utils_${pkgver}"

	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove,adept_loan_mgt} "$pkgdir"/usr/bin
	cp -a --no-preserve=ownership lib* "$pkgdir"/usr/lib
}
