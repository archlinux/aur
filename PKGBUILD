# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=conduwuit-bin
pkgdesc="a very cool, featureful fork of Conduit matrix server"
url="https://github.com/girlbossceo/conduwuit"
license=("Apache-2.0")
arch=("x86_64")
pkgver=0.4.1
pkgrel=1
makedepends=("rust" "cargo" "git" "clang")
depends=("gcc-libs" "glibc" "liburing")
source=("$pkgname-$pkgver::https://github.com/girlbossceo/conduwuit/releases/download/v${pkgver}/static-x86_64-unknown-linux-musl"
		"https://raw.githubusercontent.com/girlbossceo/conduwuit/main/LICENSE"
		"conduwuit.service"
		"conduwuit.toml")
sha512sums=('e168f44f8df4b1c66697b6eeb0db371b46d22ac051a2d22f52343bb883c2c79b5b47e5dd92bc74651a3273032826ad4666ac53638690a40a09075f71bae1d4ee'
            'b1565558be84b5a7623e158b4ec62ac189b30e7703a3f008d86eb1ab2ecdc88ae5b2ab0d19d5100adfd6ec3dfd6a0a125eaefa0cbdd20049909da53690dc5df6'
            '563b2fbfb79a018737005a2ec5232afd85b70d463b05e889d092a45cb00038c4cf9f19c9a89a28838d9dc8d7e4178ebd2edf756e1e13c18e9a02b949f7e9c286'
            '2e8387a6898c2d493052b20c21d01cf9bfcd40ad8100becd6d5efa386b662a73777c4148c9be18e1813274587086311ea57dc50ba3691e64bf8ed3444b7b27f9')
provides=("conduwuit")
options=(!lto)
backup=("etc/conduwuit.toml")

package() {
	install -Dm755 "${srcdir}/$pkgname-$pkgver" "${pkgdir}/usr/bin/conduwuit"
	install -Dm644 "${srcdir}/conduwuit.service" "$pkgdir/usr/lib/systemd/system/conduwuit.service"
	install -Dm644 "${srcdir}/conduwuit.toml" "${pkgdir}/etc/conduwuit.toml"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

