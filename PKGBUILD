pkgname=gpswatch-git
_pkgname=GpsWatch
pkgver=20141008
pkgrel=1
pkgdesc="Linux client for crane gps watch (from Aldi or Hofer)."
arch=('any')
url="https://github.com/mru00/GpsWatch"
source="git://github.com/mru00/GpsWatch.git"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-xml-writer' 'perl-device-serialport' 'libxml2')
makedepends=('git')
provides=('gpswatch')
conflicts=('gpswatch')
options=('!emptydirs')
md5sums=('SKIP')

package(){
  cd "$srcdir/$_pkgname"

  install -d "${pkgdir}"/usr/{bin,share/perl5/site_perl}
  install -d "${pkgdir}"/opt/${_pkgname}

  install -Dm755 "${srcdir}/${_pkgname}/from_watch.sh" "${pkgdir}/opt/${_pkgname}/from_watch.sh"
  sed -i "s/\.\///" "${pkgdir}/opt/${_pkgname}/from_watch.sh"
  sed -i "s/\$EDITOR/\#\$EDITOR/" "${pkgdir}/opt/${_pkgname}/from_watch.sh"
  ln -s /opt/${_pkgname}/from_watch.sh ${pkgdir}/usr/bin/gpswatch

  install -Dm755 "${srcdir}/${_pkgname}/from_serial_log.sh" "${pkgdir}/opt/${_pkgname}/from_serial_log.sh"
  sed -i "s/\.\///" "${pkgdir}/opt/${_pkgname}/from_serial_log.sh"
  ln -s /opt/${_pkgname}/from_serial_log.sh ${pkgdir}/usr/bin/from_serial_log

  install -Dm755 "${srcdir}/${_pkgname}/from_image.sh" "${pkgdir}/opt/${_pkgname}/from_image.sh"
  sed -i "s/\.\///" "${pkgdir}/opt/${_pkgname}/from_image.sh"
  sed -i "s/gpx\.xsd/\/opt\/GpsWatch\/gpx\.xsd/" "${pkgdir}/opt/${_pkgname}/from_image.sh"
  sed -i "s/TrainingCenterDatabasev2\.xsd/\/opt\/GpsWatch\/TrainingCenterDatabasev2\.xsd/" "${pkgdir}/opt/${_pkgname}/from_image.sh"
  ln -s /opt/${_pkgname}/from_image.sh ${pkgdir}/usr/bin/from_image

  install -Dm644 "${srcdir}/${_pkgname}/gpx.xsd" "${pkgdir}/opt/${_pkgname}/gpx.xsd"
  install -Dm644 "${srcdir}/${_pkgname}/TrainingCenterDatabasev2.xsd" "${pkgdir}/opt/${_pkgname}/TrainingCenterDatabasev2.xsd"

  install -Dm755 "${srcdir}/${_pkgname}/image2gpx.pl" "${pkgdir}/opt/${_pkgname}/image2gpx.pl"
  ln -s /opt/${_pkgname}/image2gpx.pl ${pkgdir}/usr/bin/image2gpx.pl
  install -Dm755 "${srcdir}/${_pkgname}/seriallog2image.pl" "${pkgdir}/opt/${_pkgname}/seriallog2image.pl"
  ln -s /opt/${_pkgname}/seriallog2image.pl ${pkgdir}/usr/bin/seriallog2image.pl
  install -Dm755 "${srcdir}/${_pkgname}/watch2image.pl" "${pkgdir}/opt/${_pkgname}/watch2image.pl"
  ln -s /opt/${_pkgname}/watch2image.pl ${pkgdir}/usr/bin/watch2image.pl
  install -Dm644 "${srcdir}/${_pkgname}/GpsWatch.pm" "${pkgdir}/usr/share/perl5/site_perl/GpsWatch.pm"
}