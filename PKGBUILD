# Mantainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=blender-lts-bin
pkgdesc='LTS blender version'
pkgver='4.2.9'
#Official Mirror(Direct Link)
_mirror="https://mirrors.dotsrc.org"

##Alternate Mirrors##
#China
#_mirror="https://mirrors.aliyun.com"
#Germany
#_mirror="https://ftp.halifax.rwth-aachen.de"
#Denmark
#_mirror="https://mirrors.dotsrc.org"
#Netherlands
#_mirror="https://ftp.nluug.nl"
#Brazil
#_mirror="https://mirrors.ocf.berkeley.edu"

_pkgfile=${pkgname%-lts-bin}-$pkgver-linux-x64.tar.xz
source=("${_mirror}/blender/release/Blender${pkgver%.*}/$_pkgfile" 'blender.sh')
pkgrel=2
license=('GPL')
arch=('x86_64')
url='https://www.blender.org'

b2sums=('c009c1f992ceaac8a5671d8d34cc4775d27771e9c9af79ca1a98cf4cdce6f0fcaa0225755c7fc80e4cdc3e9abce64707ba19b9bbbf28ebb7a200549efe446e9d'
'4a8c6ca5fbcb23b91fa3c3f091994336869b2c5b0e7fa443e4edaa68863c15f8544ef1117b9c65b414db8a5a76ce0cd06db26648e26cf06ee01c7a1c78114060')

_setvars() {
  _base_dir="$srcdir/${pkgname%-lts-bin}-$pkgver-linux-x64"
}

build() {
  _setvars
	sed -i "s/=blender/=blender-lts/" $_base_dir/blender.desktop
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
