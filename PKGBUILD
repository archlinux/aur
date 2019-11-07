# Maintainer: Javier Domingo Cansino <javierdo1@gmail.com>
pkgname=triumph-adler-printer-drivers
pkgver=20140115
pkgrel=2
pkgdesc="Triumph Adler printer drivers"
url="https://www.triumph-adler.de/"
arch=('x86_64' 'i686')
license=('None')
optdepends=(cups)
makedepends=()
source=("https://www.triumph-adler.de/resource/blob/130194/d317ddb2d4689ba40b3d24a409bf5601/talinuxpackages-ccd-clp-20140115-tar-data.gz")
sha1sums=('b2a9f5cab041060d367fe9eb140a17aadb72f0b9')

_folder=LinuxPackagesTA
if [[ $CARCH = "x86_64" ]] ; then
	_arch=64bit
elif [[ $CARCH = "i686" ]] ; then
        _arch=32bit
fi
_location=EU # Either EU or Global
_language=English # One of English, French, German, Italian, Portuguese, Spanish

package() {
  cd "${srcdir}/${_folder}"
  filter=$()
  mkdir -p ${pkgdir}/usr/share/cups/model/UTAX_TA/
  mkdir -p ${pkgdir}/usr/lib/cups/filter/
  find ${srcdir}/${_folder} -name kyofilter_B | grep $_arch | grep kyo | head -n 1 | xargs -n 1 -I, cp ',' ${pkgdir}/usr/lib/cups/filter/
  chmod +x ${pkgdir}/usr/lib/cups/filter/kyofilter_B
  find ${srcdir}/${_folder} -type f           | grep $_arch | grep $_location | grep $_language | grep -i PPD | xargs -n 1 -I, cp ',' ${pkgdir}/usr/share/cups/model/UTAX_TA/
}
