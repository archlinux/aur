# Maintainer: f4iey <f4iey@f4iey.fr>
# Contributor: Mathieu Clabaut <mathieu "dot" clabaut "at" systerel.fr>

pkgname=atelierb
_minver=1
_majver=4.7
pkgver=${_majver}.${_minver}
pkgrel=1
pkgdesc="the industrial tool to efficiently deploy the B Method"
arch=('i686' 'x86_64')
url="http://www.atelierb.eu"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
  _pkgarch=_x64
sha256sums=('ebe5a940783bb1162db56c8f25eb841fa9a55fb1b73e506bc0a65338c49a6ab5') 
            
else
  _pkgarch=
fi
depends=('libxrandr' 'libxcursor' 'libxinerama' 'fontconfig' 'libsm')

optdepends=('texlive-bin' 'firefox')
install=atelierb.install
source=(https://www.atelierb.eu/wp-content/uploads/2021/12/$pkgname-free-${pkgver}p$pkgrel-linux$_pkgarch.tar.gz)

package() {
  install -m755 -d "${pkgdir}"/opt/atelierb/${pkgver}
  DEST="${pkgdir}"/opt/atelierb/${pkgver}
  FINALDEST=atelierb-free-"${pkgver}p$pkgrel"-linux"${_pkgarch}"/opt/atelierb-free-"${pkgver}p${pkgrel}"
  #mkdir -p $DEST
  #cd $DEST
  tar xvf "${srcdir}"/atelierb-free-"${pkgver}p$pkgrel"-linux"${_pkgarch}".tar.gz
  install -Dm755 $srcdir/$FINALDEST/bbin/AtelierB.desktop $pkgdir/usr/share/applications/AtelierB.desktop 
  mv $srcdir/$FINALDEST/* $DEST
  sed -i -e "s+/opt/atelierb-${_majver}+$FINALDEST+g" $DEST/AtelierB $DEST/start*
  sed -i "s/atelierb-free-4.7.1p1/atelierb\/${pkgver}/g" "${pkgdir}"/usr/share/applications/AtelierB.desktop
}
# vim:set ts=2 sw=2 et:
