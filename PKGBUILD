# Maintainer: PSposito <http://bit.do/linuxer>  <https://gitlab.com/psposito>
# Contributor: Dimitrios - Georgios Kontopoulos <https://launchpad.net/~dgkontopoulos/+archive/ubuntu/orthcal>
pkgname="orthcal-lightthemed"
pkgver="3.0.1"
pkgrel="0"
conflicts=('orthcal-darkthemed')
pkgdesc="An Orthodox Calendar for ARCH Linux"
pkgdir="src/"
instdir="/opt/"
url="https://gitlab.com/psposito/otrhcal"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pygtk' 'python' 'perl' 'perl-gtk2-trayicon' 'perl-dbi' 'perl-dbd-sqlite' 'perl-date-calc' 'libappindicator-gtk3')
provides=("${pkgname}")
source=("https://gitlab.com/psposito/otrhcal/uploads/ee8340cb3551852d247e17ff5ae8b82d/orthcal-lightthemed-3.0.1.tar.bz2")
sha256sums=('SKIP')

package() {
  local _languages=(el es ro ru)
  local _lang
  cd "${pkgdir}" #-${pkgname}"
  install -dm 755 "$pkgdir"/opt/orthcal/bin/
  install -dm 755 "$pkgdir"/opt/orthcal/content/images
  install -dm 755 "$pkgdir"/usr/share/applications/
  for _lang in ${_languages[@]}
  do
    install -dm 755 "$pkgdir"/opt/orthcal/translations/locale/$_lang/LC_MESSAGES/
  done
  cd "${srcdir}/${pkgname}-${pkgver}/"
  pwd
  install -Dm 755 bin/OrthCal.pl "$pkgdir"/opt/orthcal/bin/OrthCal.pl
  install -Dm 755 bin/OrthCal_ind.py "$pkgdir"/opt/orthcal/bin/OrthCal_ind.py
  install -Dm 644 content/saints.db "$pkgdir"/opt/orthcal/content
  install -Dm 644 content/images/* "$pkgdir"/opt/orthcal/content/images
  for _lang in ${_languages[@]}
  do
    install -Dm 644 translations/locale/$_lang/LC_MESSAGES/* "$pkgdir"/opt/orthcal/translations/locale/$_lang/LC_MESSAGES/
  done
  install -Dm 755 extras-orthcal.desktop "$pkgdir"/usr/share/applications/
}
