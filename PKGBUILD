# Mantainer: Sergio Tridente <tioduke (at) gmail (dot) com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kde-servicemenus-getmediainfo
pkgver=0.6
pkgrel=6
pkgdesc="Simple service menu that show the mediainfo about the selected media."
arch=('any')
url="https://www.kde-look.org/p/998445/"
license=('GPL')
depends=('dolphin' 'kdialog' 'mediainfo')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1460731799/s/0e5f5fe6c6fefa8d5c07f311cf782490/t/1528071658/u/186041/141946-MediaInfoKDE.desktop"
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
