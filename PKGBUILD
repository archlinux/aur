# Maintainer: Paul <pb.orzel@proton.me>

pkgname="guppy"
pkgver=0.2.5
pkgrel=1
pkgdesc="Tool to manage your installations from Git Repositories for you"
arch=(any)
url="https://gitlab.com/Teddy-Kun/guppy"
license=('GPL-3')
depends=(
'libgit2'
'openssl'
'gcc-libs'
'glibc'
)
makedepends=(
'cargo'
)
optdepends=(
'bash: the default_make is a bash script'
'nano: default editor for the makefiles'
)
source=("https://gitlab.com/Teddy-Kun/guppy/-/archive/v${pkgver}/guppy-v${pkgver}.tar.gz")
sha256sums=('32bcb46cc1af7496d769248f4a9e3070454a408e62afe7da51159b6f22295d4f')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	cargo b --release
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/usr/share/guppy"
	mkdir -p "${pkgdir}/usr/share/licenses/guppy"
	install -Dm755 target/release/guppy -t "${pkgdir}/usr/bin/"
	install -Dm755 resources/default_make.guppy -t "${pkgdir}/usr/share/guppy/"
	install -Dm644 License.txt -t "${pkgdir}/usr/share/licenses/guppy/"
}
