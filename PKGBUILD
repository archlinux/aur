# Maintainer: MD Gaziur Rahman Noor <mdgaziurrahmannoor@gmail.com>
pkgname=findex-git
_pkgname=findex
pkgver=0.6.0.44
pkgver() {
	cd findex
	git describe --tags | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}
pkgrel=1
epoch=
pkgdesc="Highly customizable finder with high performance. Written in Rust and uses GTK"
arch=('x86_64')
url="https://github.com/mdgaziur/findex"
license=('GPL3')
groups=()
depends=("gtk3" "libkeybinder3")
makedepends=("rustup")
checkdepends=()
optdepends=()
provides=("findex-git")
conflicts=("findex-git" "findex-bin")
replaces=()
backup=()
options=()
install=post_install.install
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
    install -Dm755 target/release/findex-daemon "${pkgdir}/usr/bin/${_pkgname}-daemon"
    install -Dm644 css/style.css "${pkgdir}/opt/findex"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 
}
