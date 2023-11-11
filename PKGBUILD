# Mantainer: Sergio Tridente <tioduke (at) gmail (dot) com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kf5-servicemenus-getmediainfo
pkgver=0.6
pkgrel=8
pkgdesc="Simple service menu that show the mediainfo about the selected media."
arch=('any')
url="https://store.kde.org/p/998445/"
license=('GPL')
depends=('dolphin' 'kdialog' 'mediainfo')
replaces=('kde-servicemenus-getmediainfo')
conflicts=('kde-servicemenus-getmediainfo')
_token='098c96111392a63118c1c5a054039143'
_timestamp='1528161529'
source=(manual://141946-MediaInfoKDE.desktop
        fix_kdialog_options.patch)
md5sums=('8a14b856b510378a2dcf8bc4d2eec0c8'
         'b851d52ec6e879cd7478c8cdbeda3631')
DLAGENTS+=('manual::/usr/bin/echo The source file for this package need to be downloaded manually, since it changes frequently. Please visit https://store.kde.org/p/998445.')

prepare()
{
  cp ${srcdir}/141946-MediaInfoKDE.desktop ${srcdir}/141946-MediaInfoKDE.desktop.OK
  patch -p0 -i ${srcdir}/fix_kdialog_options.patch
  sed -e 's|video/\.\*,audio/\.\*|video/*,audio/*|g' -i ${srcdir}/*-MediaInfoKDE.desktop.OK
}

package() {
  install -Dm644 ${srcdir}/*-MediaInfoKDE.desktop.OK ${pkgdir}/usr/share/kservices5/ServiceMenus/getmediainfo.desktop
}
