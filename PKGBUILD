# Maintainer: Paul <pb.orzel@proton.me>

pkgname="gitwife"
pkgver=0.2.4
pkgrel=1
pkgdesc="Tool to manage your installations from Git Repositories for you"
arch=(any)
url="https://gitlab.com/Teddy-Kun/gitwife"
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
source=("https://gitlab.com/Teddy-Kun/gitwife/-/archive/v${pkgver}/gitwife-v${pkgver}.tar.gz")
sha256sums=('2f7806a536369c934eeefe6ed9f7eaa87054a169307bdd04508b824703a3c0d7')

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	cargo b --release --no-default-features
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/usr/share/gitwife"
	mkdir -p "${pkgdir}/usr/share/licenses/gitwife"
	install -Dm755 target/release/gitwife -t "${pkgdir}/usr/bin/"
	install -Dm755 resources/default_make.gitwife -t "${pkgdir}/usr/share/gitwife/"
	install -Dm644 License.txt -t "${pkgdir}/usr/share/licenses/gitwife/"
}
