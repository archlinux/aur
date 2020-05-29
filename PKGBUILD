# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leone <comdir@infonix.info>
pkgname=litemanager
pkgver=4.9
pkgrel=1
epoch=
pkgdesc="remote access software for remote administration of computers over the Internet or remote control in a local network, for distant learning, providing remote support to users and supervising work activity of employees."
arch=('x86_64')
url="http://www.litemanager.com"
license=('custom')
groups=()
depends=()
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://litemanager.com/soft/LiteManager_linux.zip")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "internet;" \
    --icon "${_pkgname}" \
    --exec "litemanager"
	
}


package() {
  install -d "${pkgdir}/" "$pkgdir/opt/${pkgname}"
  install -Dm755 "${srcdir}/LiteManager" "$pkgdir/opt/litemanager/litemanager"
  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/litemanager/litemanager" "$pkgdir/usr/bin/litemanager"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
}
