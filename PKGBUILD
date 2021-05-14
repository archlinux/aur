# Maintainer: Ashin Antony <ashinant15@gmail.com>
pkgname=dwm-ashin-git
pkgver=6.2
pkgrel=1
pkgdesc="A heavily-patched and customized build of dwm with rainbow tags,customized bar and all."
arch=(x86_64 i686)
url="https://github.com/ashincoder/dwm-ashin"
license=('MIT')
groups=()
depends=(libx11 libxinerama nerd-fonts-fira-code ttf-joypixels freetype2 libxft-bgra-git )
makedepends=(make)
checkdepends=()
optdepends=('surf-ashin-git: Lightweight browser' 
            'dmenu-ashin-git: For better working of the programs'
            'st-ashin-git: Terminal ready to use out of the box'
            'tabbed-ashin-git: for tabs in st and surf')
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
  cd dwm-ashin
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dwm-ashin  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwm-ashin/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/dwm-ashin/README.md"
  install -Dm644 "${srcdir}/dwm-ashin/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}

