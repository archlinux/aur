# Creator: Dimitris Panokostas
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>

pkgname=amiberry
pkgver=bce5e0ad9e775b24366ff42a3ebbaf1a28ac21ec
pkgrel=3
epoch=20231201
pkgdesc="Amiga Emulator for ARM Boards (amd64 build)"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport')
makedepends=('glibc' 'git' 'cmake')
provides=("amiberry=${pkgver}")
conflicts=('amiberry')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make PLATFORM=x86-64
}

package() {
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/"

  cp -r "${srcdir}/${pkgname}"/* "${pkgdir}/usr/share/${pkgname}/"

  # Create a wrapper script to set the CWD
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo "cd /usr/share/${pkgname}" >> "${pkgdir}/usr/bin/${pkgname}"
  echo "./${pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"
  
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  echo -e "\e[1;33mAmiberry has no .desktop entry, please run from \"amiberry\" on your terminal\e[0m"
}
