# Maintainer: David Phillips <dbphillipsnz@gmail.com>

_sourcedir="AnnePro2-Tools"
_pkgname="annepro2-tools"
pkgname="$_pkgname-git"
pkgver=r19.d10d476
pkgrel=1
pkgdesc="Alternative firmware update tool for the Anne Pro 2 keyboard"
arch=('x86_64')
url="https://github.com/OpenAnnePro/AnnePro2-Tools"
license=('GPL2')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/OpenAnnePro/AnnePro2-Tools.git")
md5sums=('SKIP')

pkgver() {
	cd "$_sourcedir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_sourcedir"
	cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "$_sourcedir"
	install -Dm 755 target/release/annepro2_tools -t "${pkgdir}/usr/bin"
}
