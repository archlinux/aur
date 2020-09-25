# Maintainer: nho1ix <phuongnhoclu@gmail.com>
pkgname=dwm-nho1ix-git
pkgver=6.2.r1845.afaddc4
pkgrel=1
pkgdesc="nho1ix's patched build of dwm."
arch=(any)
url="https://github.com/nho1ix/dwm.git"
license=('MIT')
groups=(base-devel)
depends=(libx11 libxinerama libxft-bgra-git otf-hermit ttf-font-awesome freetype2)
makedepends=(git)
optdepends=(dunst ios-emoji)
provides=(dwm)
conflicts=(dwm)
replaces=(dwm dwm-distrotube-git)
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "dwm"
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dwm  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/dwm/README.md"
#  install -Dm644 "${srcdir}/dwm/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
