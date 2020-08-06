pkgname=dwm-supermario9590-git
pkgver=6.2.r2.b28cc27
pkgrel=1
pkgdesc="A heavily-patched and customized build of dwm from Supermario9590."
arch=(x86_64 i686)
url="https://gitlab.com/supermario9590/dwm-supermario9590.git"
license=('MIT')
groups=()
depends=(libx11 st dmenu)
makedepends=(make)
checkdepends=()
optdepends=(surf)
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
  cd dwm-supermario9590
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dwm-supermario9590  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm-supermario9590/LICENSE"
  install -Dm644 "${srcdir}/dwm-supermario9590/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

