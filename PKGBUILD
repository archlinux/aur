# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=idazki-desktop
pkgver=4.0.5
pkgrel=1
_pkgdld="idazki-desktop-linux64.run"
epoch=
pkgdesc="Idazki Desktop application of Izenpe CA"
arch=('x86_64')
url="http://www.izenpe.eus"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=('ca-certificates-izenpe')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=idazki-desktop.install
changelog=
source=("https://www.izenpe.eus/contenidos/informacion/idazki_izenpe/es_def/adjuntos/${_pkgdld}")
noextract=()
sha256sums=('057e7c91cbf225f12e39438dbcb39938b6ef8bef761f2bf8a55d167098086a81')
validpgpkeys=()

prepare() {
  install -d "${_pkgdld%.*}/$pkgname"
  tail -n+22 $_pkgdld | tar -xz -C "${_pkgdld%.*}"
  tar xf "${_pkgdld%.*}/$pkgname.tar" -C "${_pkgdld%.*}/$pkgname"
  cd "${_pkgdld%.*}/$pkgname"
}

package() {
  install -d "$pkgdir/usr/local"
  cp -dr --preserve=mode,timestamp "$srcdir/${_pkgdld%.*}/$pkgname" "$pkgdir/usr/local"
  install -d "$pkgdir/usr/share/applications/"
  install -m 0755 "$srcdir/${_pkgdld%.*}/$pkgname/idazki-desktop.desktop" \
    "$srcdir/${_pkgdld%.*}/$pkgname/idazki-delegado.desktop" \
    "$pkgdir/usr/share/applications/"
}
