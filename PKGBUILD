# Maintainer: Eugene Dementyev <e@dementyev.me>
_pkgname=terraform
pkgname=terraform-nowarning
pkgver=0.14.7
pkgrel=1
epoch=
pkgdesc="Terraform with a patch that makes it not complain about undeclared variables"
arch=(any)
url="https://terraform.io"
license=('Mozilla Public License 2.0')
groups=()
depends=()
makedepends=(go gox)
checkdepends=()
optdepends=()
provides=(terraform)
conflicts=(terraform)
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgname}-$pkgver.tar.gz::https://github.com/hashicorp/terraform/archive/v$pkgver.tar.gz"
        "$pkgname.patch")
noextract=()
md5sums=(e52aa77e809c152b31a005c44363ca20 6b445af404241396b5581db62e849765)
validpgpkeys=()

prepare() {
	cd "${_pkgname}-${pkgver}"
	patch -p1 -i "$srcdir/$pkgname.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"
	TF_DEV=1 ./scripts/build.sh
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm755 bin/terraform "$pkgdir/usr/bin/terraform"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
