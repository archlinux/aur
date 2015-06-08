# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=xnconvert
pkgver=1.66
pkgrel=3
pkgdesc="A cross-platform batch image-converter and resizer with a powerful and ease of use experience."
url="http://www.xnview.com/en/xnconvert/"

arch=('x86_64' 'i686')
license=('custom')
depends=('glib2' 'expat' 'libpng12' 'desktop-file-utils')

install='xnconvert.install'

source=(${pkgname}-${pkgver}.tgz::"http://download.xnview.com/XnConvert-linux.tgz")
md5sums=('c02bde2c1a8cf6ba93d4e4ec14e1b7f7')

if [ "$CARCH" = 'x86_64' ]; then
  source=(${pkgname}-${pkgver}.tgz::"http://download.xnview.com/XnConvert-linux-x64.tgz")
md5sums=('242a815084801c1a2e28f5b190ca5b3b')

fi


package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/applications"

  cp -R "${srcdir}/XnConvert"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/xnconvert.sh" "${pkgdir}/usr/bin/${pkgname}"

  cat <<-_EOF_ > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Encoding=UTF-8
Terminal=0
Exec=${pkgname}
Icon=/opt/${pkgname}/xnconvert.png
Type=Application
Categories=Graphics;
StartupNotify=true
Name=XnConvert
GenericName=XnConvert
MimeType=image/bmp;image/gif;image/x-portable-bitmap;image/x-portable-pixmap;image/x-psd;image/x-tga;image/x-xbitmap;image/tiff;image/jpeg;image/x-psd;image/png;image/x-icon;image/x-xpixmap;image/svg+xml;
_EOF_

  install -D -m644 "${srcdir}/XnConvert/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
