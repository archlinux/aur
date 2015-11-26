# Maintainer: caus909 <contact "at" caus909 "dot" net>
# Contributor: Mathieu Clabaut <mathieu "dot" clabaut "at" systerel.fr>

pkgname=atelierb
_minver=1
_majver=4.2
pkgver=${_majver}.${_minver}
pkgrel=1
pkgdesc="the industrial tool to efficiently deploy the B Method"
arch=('i686' 'x86_64')
url="http://www.atelierb.eu"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
  _pkgarch=_x64
sha256sums=('e4900224cd6c7e82aad1cfc033aa6144f4e4c7998d468ae0dc285432d533c35a'
            '2cd3246d12597e1e7b8b72180904a0aa479b70df7b669824372b1fc2f30f80d3'
            '13d30733e737e732812ae52e37d9fea4650fd18d2e8cfb8631ebbc76d9e8d770')
else
  _pkgarch=
fi
depends=('libxrandr' 'libxcursor' 'libxinerama' 'fontconfig' 'libsm')

optdepends=('texlive-bin' 'firefox')
install=atelierb.install
source=(http://www.atelierb.eu/atelier-b/${_majver}/free/atelierb-free-${pkgver}-linux${_pkgarch}.deb
	AtelierB.desktop
	http://www.atelierb.eu/wp-content/uploads/sites/3/atelierb/licences/4.0/licence-atelier-b-utilisation-en-V4.pdf)



package() {
  install -m755 -d "${pkgdir}"/opt/atelierb/
  DEST="${pkgdir}"/opt/atelierb/"${pkgver}"
  FINALDEST=/opt/atelierb/"${pkgver}"
  mkdir -p $DEST
  cd $DEST
  ar vx "${srcdir}"/atelierb-free-"${pkgver}"-linux"${_pkgarch}".deb
  tar xfz data.tar.gz
  mv ./opt/atelierb-"${_majver}"/* $DEST
  rm -fr data.tar.gz control.tar.gz debian-binary opt
  install -m755 -d "${pkgdir}"/usr/share/applications/
  sed -i -e "s+/opt/atelierb-${_majver}+$FINALDEST+g" $DEST/AtelierB $DEST/start*
  cp "${srcdir}"/AtelierB.desktop "${pkgdir}"/usr/share/applications/
  sed -i -e "s+4.1.0+${pkgver}+g" "${pkgdir}"/usr/share/applications/AtelierB.desktop
}
# vim:set ts=2 sw=2 et:
