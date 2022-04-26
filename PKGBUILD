# Mantainer: Yuri dos Santos <yrds96@protonmail.com>

pkgname=blender-lts-bin
pkgdesc='LTS blender version'
pkgver='2.93.9'
_mirror="https://mirror.clarkson.edu/blender/release"
#_mirror="https://mirror.clarkson.edu/"
_pkgfile=${pkgname%-lts-bin}-$pkgver-linux-x64.tar.xz
source=("${_mirror}/blender/release/Blender${pkgver%.*}/$_pkgfile" 'blender.sh')
pkgrel=1
license=('GPL')
arch=('x86_64')
url='https://www.blender.org'

b2sums=('6a8f81dd48ab0a29e95340c3629062e32ebe3a3a62a6bba2fbc5b962a8fd04515f734f72a56559f79fce344f272cf122a5a62ae1172bf472d7885c9bfbab164b'
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
