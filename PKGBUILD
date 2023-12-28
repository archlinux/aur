# Mantainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=blender-lts-bin
pkgdesc='LTS blender version'
pkgver='3.6.7'
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
#Brazil
#_mirror="https://mirrors.ocf.berkeley.edu"

_pkgfile=${pkgname%-lts-bin}-$pkgver-linux-x64.tar.xz
source=("${_mirror}/blender/release/Blender${pkgver%.*}/$_pkgfile" 'blender.sh')
pkgrel=1
license=('GPL')
arch=('x86_64')
url='https://www.blender.org'

b2sums=('48332112c1de7da9996a9753ab8f65f8bb300a69ef691661b334ac09747da75b476210ac760f8d157facc03ae170f2151f9cf47389fbd88220653862d6464d54'
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
