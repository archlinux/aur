# Maintainer: Agustin Dolard
pkgname=dwm-vus-git
pkgver=6.2.r1692.21b0c76
pkgrel=1
pkgdesc="A heavily-patched build of dwm."
arch=(x86_64 i686)
url="http://15.228.28.1:3000/agus/dwm-vus.git"
license=('MIT')
groups=()
depends=(libx11 libxinerama libxft-bgra ttf-fira-code ttf-joypixels)
makedepends=(make git)
checkdepends=()
optdepends=()
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dwm-vus
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dwm-vus  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm-distrotube/LICENSE"
}
