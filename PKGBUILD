# Maintainer: Lapis Apple <laple@pd2.ink>
# Contributor: Codist <countstarlight@gmail.com>
# Contributor: taotieren <admin@taotieren.com>
pkgname=deepin-wine-qqmusic
pkgver=17.73.10.0002
debpkgver=17.73deepin10
debpkgname="com.qq.music.deepin"
pkgrel=1
pkgdesc="Tencent QQMusic on Deepin Wine5(${debpkgname}) For Archlinux"
arch=("x86_64")
url="https://y.qq.com/"
license=('custom')
depends=('p7zip' 'wine' 'wine-mono' 'wine-gecko' 'xorg-xwininfo' 'wqy-microhei' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-libpulse' 'lib32-openal' 'lib32-mpg123' 'lib32-gnutls')
conflicts=('deepin.com.qq.qqmusic')
install="deepin-wine-qqmusic.install"
_mirror="https://community-store-packages.deepin.com"
source=("$_mirror/appstore/pool/appstore/c/${debpkgname}/${debpkgname}_${debpkgver}_i386.deb"
        "run.sh")
md5sums=('350dd5fb3f0725c76767573397bccd4f'
         '0030cd1cbf5221658e386cba1bc60b39')


build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  sed "s/\(Categories.*$\)/\1Media;/" -i "${srcdir}/dpkgdir/opt/apps/${debpkgname}/entries/applications/${debpkgname}.desktop"
  sed "s/run.sh\".*/run.sh\"/" -i "${srcdir}/dpkgdir/opt/apps/${debpkgname}/entries/applications/${debpkgname}.desktop"
}


package() {
  msg "Preparing icons ..."
  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/dpkgdir/opt/apps/${debpkgname}/entries/applications/${debpkgname}.desktop" "${pkgdir}/usr/share/applications/${debpkgname}.desktop"
  cp -r "${srcdir}/dpkgdir/opt/apps/${debpkgname}/entries/icons/" "${pkgdir}/usr/share/"
  msg "Copying deepin files ..."
  install -d "${pkgdir}/opt/apps/${debpkgname}/files"
  install -m644 "${srcdir}/dpkgdir/opt/apps/com.qq.music.deepin/files/files.7z" "${pkgdir}/opt/apps/${debpkgname}/files/"
  cp ${srcdir}/dpkgdir/opt/apps/${debpkgname}/files/helper_archive* "${pkgdir}/opt/apps/${debpkgname}/files/"
  install -m755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${debpkgname}/files/"
}
