# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=bike4win
_pkgname=bike4win-lin
pkgver=5.04.005
pkgrel=2
pkgdesc='Free daily cycle in which the parameters can save routes traveled by bicycle.'
arch=('i686' 'x86_64')
url="http://www.bike4win.pl"
license=('GPL')
depends=(qt4)
options=(!strip)
install='bike4win.install'
case $CARCH in
  i686)
    source=("http://www.bike4win.pl/homepage/Pobierz_files/${_pkgname}-32bit-${pkgver}.deb")
    _pkgname=${_pkgname}-32bit-${pkgver}.deb
    md5sums=('f67bfa548a0ee53ed9c944dd38bb5fb1')
    ;;
  x86_64)
    source=("http://www.bike4win.pl/homepage/Pobierz_files/${_pkgname}-64bit-${pkgver}.deb")
    _pkgname=${_pkgname}-64bit-${pkgver}.deb
    md5sums=('7a11007ef9fe482f6b93210d8cb73dc0')
    ;;
esac
build(){
  cd "$srcdir"
  tar zxf data.tar.gz

  install -dm755 ${pkgdir}/usr/share/{applications,menu,pixmaps}
  install -dm755 ${pkgdir}/usr/bin

  install -Dm755 ${srcdir}/usr/local/bike4win/bike4win ${pkgdir}/usr/bin/
  install -Dm644 ${srcdir}/usr/local/bike4win/bike4win.png ${pkgdir}/usr/share/pixmaps/
  install -Dm644 ${srcdir}/usr/share/applications/bike4win.desktop ${pkgdir}/usr/share/applications/
  install -Dm644 ${srcdir}/usr/share/menu/bike4win ${pkgdir}/usr/share/menu/

  sed -i -e 's#Exec=/usr/local/bike4win/bike4win#Exec=/usr/bin/bike4win#' \
    -e 's#Icon=/usr/local/bike4win/bike4win.png#Icon=/usr/share/pixmaps/bike4win.png#' \
    ${pkgdir}/usr/share/applications/bike4win.desktop
  sed -i -e 's#command="/usr/local/bike4win/bike4win"#command="/usr/bin/bike4win"#' \
    -e 's#icon="/usr/local/bike4win/bike4win.png"#icon="/usr/share/pixmaps/bike4win.png"#' \
    ${pkgdir}/usr/share/menu/bike4win
  if which chrpath &>/dev/null; then
    chrpath -d ${pkgdir}/usr/bin/$pkgname 
  fi
}
