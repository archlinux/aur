# Mantainer: Sergio Tridente <tioduke (at) gmail (dot) com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kde-servicemenus-getmediainfo
pkgver=0.6
pkgrel=4
pkgdesc="Simple service menu that show the mediainfo about the selected media."
arch=('any')
url="https://www.kde-look.org/p/998445/"
license=('GPL')
depends=('dolphin' 'kdialog' 'mediainfo')
source=("141946-MediaInfoKDE.desktop::https://www.opendesktop.org/p/998445/startdownload?file_id=1460731799&file_name=141946-MediaInfoKDE.desktop&file_type=text/plain&file_size=882&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownloadfile%2Fid%2F1460731799%2Fs%2F33aa5e538ac2723c5d7f52a51341f816%2Ft%2F1525387126%2Fu%2F186041%2F141946-MediaInfoKDE.desktop"
        fix_kdialog_options.patch)
md5sums=('8a14b856b510378a2dcf8bc4d2eec0c8'
         'b851d52ec6e879cd7478c8cdbeda3631')

prepare()
{
  cp ${srcdir}/141946-MediaInfoKDE.desktop ${srcdir}/141946-MediaInfoKDE.desktop.OK
  patch -p0 -i ${srcdir}/fix_kdialog_options.patch
  sed -e 's|video/\.\*,audio/\.\*|video/*,audio/*|g' -i ${srcdir}/*-MediaInfoKDE.desktop.OK
}

package() {
  install -Dm644 ${srcdir}/*-MediaInfoKDE.desktop.OK ${pkgdir}/usr/share/kservices5/ServiceMenus/getmediainfo.desktop
}
