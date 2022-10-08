# Maintainer: DevGuyAhnaf <ahnaf@ahnafzamil.com>
pkgname=chadwm-devguyahnaf-git
_pkgname=chadwm
_output_dir=~/.config/chadwm
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="DevGuyAhnaf's version of ChadWM (DWM Modif)"
arch=('x86_64' 'i686')
url="https://gitlab.com/ahnaf-zamil/chadwm"
license=('MIT')
depends=('picom' 'feh' 'acpi' 'rofi' 'pavucontrol' 'dash' 'imlib2' 'xorg-xsetroot' 'wget' 'xorg-server')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('dwm')
conflicts=('dwm')
source=("$_pkgname::git+https://gitlab.com/ahnaf-zamil/chadwm.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	mkdir "$_output_dir"
	cp -r "./" "$_output_dir"	
	cd "$_output_dir/chadwm"
	make
}

package() {
	cd "$_output_dir/chadwm"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
