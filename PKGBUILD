# Maintainer: Yasuo Ozu <yasuo@ozu.email>

pkgname=goneovim
pkgver=0.4.3
pkgrel=1
arch=(x86_64)
pkgdesc='Neovim GUI written in Golang, using a Golang qt backend'
url='https://github.com/akiyosi/goneovim'
license=(MIT)
depends=(neovim glibc gcc-libs libx11 nss nspr fontconfig freetype2 expat zlib libglvnd libxcb)
makedepends=(coreutils tar)
source=("https://github.com/akiyosi/goneovim/releases/download/v$pkgver/Goneovim-$pkgver-linux.tar.bz2")
sha256sums=('e49e77885edcbd6acc40d9af4c2e4e67f1686747250ec123802dd74c1652290d')

prepare() {
  cd "Goneovim-${pkgver}-linux"
  sed -ie 's:/path/to:/opt/goneovim:' goneovim.desktop
}

build() {
  :
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -r "${srcdir}/Goneovim-${pkgver}-linux" "${pkgdir}/opt/goneovim"
  ln -snf "/opt/goneovim/goneovim" "${pkgdir}/usr/bin/goneovim"
  cd "${srcdir}/Goneovim-${pkgver}-linux"
  install -Dm644 goneovim.desktop "${pkgdir}/usr/share/applications/goneovim.desktop"
}