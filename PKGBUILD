# Mantainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=blender-lts-bin
pkgdesc='LTS blender version'
pkgver='2.93.11'
#USA Mirror
_mirror="https://mirror.clarkson.edu"

##Alternate Mirrors##
#China
#_mirror="https://mirrors.aliyun.com"
#Germany
#_mirror="https://ftp.halifax.rwth-aachen.de"
#Denmark
#_mirror="https://mirrors.dotsrc.org"
#Netherlands
#_mirror="https://ftp.nluug.nl"
#Singapore
#https://mirror.freedif.org/blender/release/Blender2.93/blender-2.93.11-linux-x64.tar.xz
#Brazil
#_mirror="https://mirrors.ocf.berkeley.edu"

_pkgfile=${pkgname%-lts-bin}-$pkgver-linux-x64.tar.xz
source=("${_mirror}/blender/release/Blender${pkgver%.*}/$_pkgfile" 'blender.sh')
pkgrel=1
license=('GPL')
arch=('x86_64')
url='https://www.blender.org'

b2sums=('6836d8f92693b61a6c8933440dadd53e7ac4e8c27e0f6d1d73cc490c39c6e12178bb06f59633147b4e2d551c3194cc52e01443f193ea772f0315471dde31b1f6'
'903039ab42d250063286fa6a5e3687e84c9c6018a0e6654423e7649542d8394c19e6ed8ccaa549bd373ad66bc8e5b7b65203781cde26420f4e00183935e766f3')

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
  install -Dm644 "$_base_dir/license/GPL-license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
