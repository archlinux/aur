# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: MD Gaziur Rahman Noor <mdgaziurrahmannoor@gmail.com>
pkgname=findex-git
_pkgname=findex
pkgver=0
pkgrel=0
epoch=
pkgdesc="Highly customizable finder with high performance. Written in Rust and uses GTK"
arch=('x86_64')
url="https://github.com/mdgaziur/findex"
license=('GPL3')
groups=()
depends=("gtk3")
makedepends=("rustup")
checkdepends=()
optdepends=()
provides=("findex-git")
conflicts=("findex-git" "findex-bin")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/mdgaziur/findex")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

build() {
	cd $_pkgname
	git checkout development

	rustup default stable
	cargo build --release
}

package() {
	cd "$_pkgname"
	
	install -Dm755 target/release/findex "${pkgdir}/usr/bin/${_pkgname}"
	mkdir -p "${pkgdir}/opt/findex"
	cp ./css/style.css "${pkgdir}/opt/findex"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
