# Maintainer: Ashin Antony <ashinant15@gmail.com>
pkgname=dwmblocks-ashin-git
pkgver=1.0.
pkgrel=1
pkgdesc="My build of dwmblocks for use with my build of dwm."
arch=(x86_64 i686)
url="https://github.com/ashin/dwmblocks-ashin.git"
license=('ISC')
groups=()
depends=( nerd-fonts-fira-code dwm-ashin-git libxft-bgra-git)
makedepends=(make)
checkdepends=(nerd-fonts-fira-code)
optdepends=()
provides=(dwmblocks)
conflicts=(dwmblocks)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd dwmblocks-ashin 
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dwmblocks-ashin/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/dwmblocks-ashin/README.md"
  chmod 0755 ${pkgdir}/opt/${pkgname}/scripts/*
}

