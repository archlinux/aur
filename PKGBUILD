# Mantainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=blender-lts-bin
pkgdesc='LTS blender version'
pkgver='5.2.5'
pkgrel=1
#Official Mirror(Direct Link)
_mirror="https://download.blender.org"

## Alternate Mirrors ##
#_mirror="https://ftp.halifax.rwth-aachen.de/blender"  #Germany
#_mirror="https://ftp.nluug.nl/pub/graphics/blender"   #Netherlands

_pkgfile=${pkgname%-lts-bin}-$pkgver-linux-x64.tar.xz
source=("${_mirror}/release/Blender${pkgver%.*}/$_pkgfile" 'blender.sh')
license=('GPL')
arch=('x86_64')
url='https://www.blender.org'

b2sums=('af70ac130e8d8738d4abadb93ebcb07e5d8c85cd34cf2efe9ed91a47c63b1f59358e1543d3e56485c37e4aef2f27ec88688c6a93fd7e9a870184bc80d7f50fef'
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
