# Maintainer: Christian Pinedo <chr.pinedo@gmail.com>
pkgname=idazki-desktop
pkgver=3.6.2
pkgrel=3
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
sha256sums=('494eff1444c5d6bbbc5e45b22a73f821fb587f01989cd3964ef364e99d3a2c12')
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
