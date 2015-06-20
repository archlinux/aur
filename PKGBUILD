# Maintainer: Eric Anderson <ejona86@gmail.com>

pkgname=jamestown-gtp
pkgver=1.0.2
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc='Gunpower, Treason, & Plot: DLC for a neo-classical top-down shooter (DLC sold separately)'
arch=('any')
url='http://www.finalformgames.com/jamestown/'
license=('custom')
depends=('jamestown>=1.0.2')
source=("hib://JamestownLinux_${_pkgver}_GTP_1409159048.zip")
md5sums=('4488a432df220b448cd858ca9fa06618')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

build() {
  cd "${srcdir}"

  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -x -C "${pkgname}-${pkgver}" -f "JamestownGTPInstaller_${_pkgver}-bin"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cd data
  find Archives -type f -exec \
      install -Dm644 {} "${pkgdir}/opt/jamestown/{}" \;

  install -Dm644 Jamestown_GTPEULA.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/Jamestown_GTPEULA.txt "
}
