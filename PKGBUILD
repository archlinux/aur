# Mantainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=blender-lts-bin
pkgdesc='LTS blender version'
pkgver='4.5.11'
#Official Mirror(Direct Link)
_mirror="https://download.blender.org"

## Alternate Mirrors ##
#_mirror="https://ftp.halifax.rwth-aachen.de/blender"  #Germany
#_mirror="https://ftp.nluug.nl/pub/graphics/blender"   #Netherlands

_pkgfile=${pkgname%-lts-bin}-$pkgver-linux-x64.tar.xz
source=("${_mirror}/release/Blender${pkgver%.*}/$_pkgfile" 'blender.sh')
pkgrel=1
license=('GPL')
arch=('x86_64')
url='https://www.blender.org'

b2sums=('a94c25b32cc233d49ef034ccb4518b7700d5998454478d1f1b40eb3c338a7033ac77f3def3143f5ca07a6a917271e5ec6f6822e7458a3c9acd2a2d33197c55ea'
'7009d16d3afe2c59d3b906b32fdb5540ad70b221e84f308959986d58e4a5391cdcc49f78651c5039ea94f1cf305e6cf39b01c105e05fb0e76f6c3cc068e06bf4')

_setvars() {
  _base_dir="$srcdir/${pkgname%-lts-bin}-$pkgver-linux-x64"
}

build() {
  _setvars
	sed -i "s/Exec=blender/Exec=blender-lts/" $_base_dir/blender.desktop
	sed -i "s/Name=Blender/Name=Blender LTS/" $_base_dir/blender.desktop
  #TODO MAKE SOME sed to .desktop to replace blender with blender-lts
}
package() {
  _setvars
  install -d "$pkgdir/opt"
  cp -r "$_base_dir" "$pkgdir/opt/blender-lts"

  install -Dm644 "$_base_dir/blender.desktop" "${pkgdir}/usr/share/applications/blender-lts.desktop"
  install -Dm755 "${srcdir}/blender.sh" "${pkgdir}/usr/bin/blender-lts"
  install -Dm644 "$_base_dir/license/spdx/GPL-3.0-or-later.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
