# Maintainer: Kelly Runnels <kcrunnels15@gmail.com>
pkgname=dwm-kelly-git
pkgver=6.2.r.
pkgrel=1
pkgdesc="A moderately patched and customized build of dwm."
arch=(x86_64 i686)
url="https://github.com/kcrunnels1515/dwm-kelly.git"
license=('MIT')
groups=()
depends=(libx11 libxinerama libxft ttf-hack ttf-joypixels freetype2 dmenu alacritty rofi nerd-fonts-mononoki)
makedepends=(make)
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
  cd dwm-kelly
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dwm-kelly  
  mkdir -p ${pkgdir}/opt/${pkgname}
  mkdir -p ${pkgdir}/usr/share/xsessions
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm-kelly/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/dwm-kelly/README.md"
  install -Dm644 dwm.png "${pkgdir}/usr/share/icons/dwm.png"
  install -Dm644 "${srcdir}/dwm-kelly/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

