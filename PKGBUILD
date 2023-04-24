# Maintainer: Paul <pb.orzel@proton.me>

_pkgname="guppy"
pkgname="guppy-git"
pkgver=0.2.5.r4.g627ed22
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
source=("git+https://gitlab.com/Teddy-Kun/guppy.git/")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cargo b --release
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/guppy"
	mkdir -p "${pkgdir}/usr/share/licenses/guppy"
	install -Dm755 target/release/guppy -t "${pkgdir}/usr/bin/"
	install -Dm755 resources/default_make.guppy -t "${pkgdir}/usr/share/guppy/"
	install -Dm644 License.txt -t "${pkgdir}/usr/share/licenses/guppy/"
}
