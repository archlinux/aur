# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

pkgname=st-dchaovii-git
pkgver=0.8.4.r.
pkgrel=1
epoch=
pkgdesc="Personal Build of st by DChaovII"
arch=(x86_64 i686)
url="https://github.com/DChaovII/st-dchaovii"
license=('MIT')
groups=()
depends=(nerd-fonts-dejavu-complete)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "0.8.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd st-dchaovii
	make X11INC=/usr/inculde/X11 X11LIB=/usr/lib/X11
}

package() {
	cd st-dchaovii
        mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}	
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
