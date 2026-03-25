# Maintainer: lautaro <tu-email>
pkgname=linux-silvermont
pkgver=6.18.20
pkgrel=1
pkgdesc="Kernel TKG-PDS y Headers optimizados para Silvermont (Binarios)"
arch=('x86_64')
url="https://github.com/Lauta-dev/linux-tkg"
license=('GPL')
depends=('coreutils' 'kmod' 'initramfs')
options=('!strip' '!debug')

source=(
  "kernel::https://github.com/Lauta-dev/linux-tkg/releases/download/kernel-6.14-silvermont-3/linux618-tkg-pds-llvm-6.18.20-273-x86_64.pkg.tar.zst"
  "header::https://github.com/Lauta-dev/linux-tkg/releases/download/kernel-6.14-silvermont-3/linux618-tkg-pds-llvm-headers-6.18.20-273-x86_64.pkg.tar.zst"
)

# updpkgsums
sha256sums=(
  '98f583503482b941244f7156281330f3158cee3bb17ef33c4a01cf33d4f94120'
  '3a06b01124b300146d2edb0c53857c772d01400ae80b0e0f65371a9094439748'
)

prepare() {
  msg2 "Descomprimiendo binarios manualmente..."
  
  # h = header, k = kernel
  mkdir -p "$srcdir/k"
  mkdir -p "$srcdir/h"
  
  tar -xf "$srcdir/kernel.tar.zst" -C "$srcdir/k"
  tar -xf "$srcdir/header.tar.zst" -C "$srcdir/h"
}

package() {
  msg2 "Instalando archivos del Kernel..."
  cp -a "$srcdir/k/." "$pkgdir/"

  msg2 "Instalando archivos de Headers..."
  cp -a "$srcdir/h/." "$pkgdir/"

  # Limpiamos los metadatos de los paquetes originales para que no choquen
  rm -f "$pkgdir"/.{PKGINFO,BUILDINFO,MTREE}
}
