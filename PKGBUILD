# Maintainer: Dónal Murray <dmurray654@gmail.com>
# Contributor: Troy Engel <troyengel+arch@gmail.com>

pkgname=vidyodesktop
pkgver=3.6.3.017
pkgrel=6
pkgdesc="VidyoDesktop(TM) video conferencing client"
arch=('i686' 'x86_64')
url="http://www.vidyo.com"
license=('custom')
install=vidyodesktop.install
options=('emptydirs')
conflicts=('vidyo')
depends=('alsa-lib' 'libidn' 'libutil-linux' 'libxv' 'libgl' 'glu'
         'glibc' 'libxfixes' 'libxrandr' 'libxss' 'glib2' 'libsm' 'libice'
         'libxrender' 'fontconfig' 'freetype2' 'libxext' 'libx11' 'libffi'
         'gcc-libs' 'zlib' 'libpng' 'qtwebkit' 'zenity' 'trayer')
optdepends=('flashplugin: Join meetings via web browser')

source_i686=("https://client-downloads.vidyocloud.com/VidyoDesktopInstaller-ubuntu-TAG_VD_3_6_3_017.deb")
md5sums_i686=('46c8d283e40957cc80049bd37dbf3aac')

source_x86_64=("https://client-downloads.vidyocloud.com/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_6_3_017.deb")
md5sums_x86_64=('ede8e63b96cf47d0ea12779a32480c9a')

prepare() {
  tar -zxf data.tar.gz
}

package() {
  cp -dpr "${srcdir}/opt" "${pkgdir}"
  cp -dpr "${srcdir}/usr" "${pkgdir}"
  install -dm1777 "${pkgdir}/opt/vidyo/VidyoDesktop/lic"
  install -Dm0644 "${pkgdir}/opt/vidyo/VidyoDesktop/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir "${pkgdir}/opt/vidyo/VidyoDesktop/lib"
  ln -s '/usr/lib/libidn.so' "${pkgdir}/opt/vidyo/VidyoDesktop/lib/libidn.so.11"
  sed -i 's#/opt/vidyo/VidyoDesktop/$EXEC#LD_LIBRARY_PATH=/opt/vidyo/VidyoDesktop/lib /opt/vidyo/VidyoDesktop/$EXEC#g' "${pkgdir}/usr/bin/VidyoDesktop"
}

