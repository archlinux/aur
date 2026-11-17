# Maintainer:
# Contributor: m4dz <code(at)m4dz(dot)net>

_deb_pkgrel=1

pkgname="cnijfilter2-mg7700"
pkgver=5.20
pkgrel=4
pkgdesc='Canon InkJet Printer Driver (PIXMA MG3640, MG3650, MG5740, MG5750, MG6840, MG6850, MG7720, MG7740, MG7750)'
url='https://th.canon/en/support/0100690202'
arch=('i686' 'x86_64')
license=('LicenseRef-Canon')

depends=(
  'cups'
  'ghostscript'
  'libxml2-legacy'
)

provides=("cnijfilter2=$pkgver")
conflicts=('cnijfilter-common' 'cnijfilter2')

_filename="cnijfilter2-$pkgver-$_deb_pkgrel"
_pkgext="tar.gz"
source=("https://gdlp01.c-wss.com/gds/2/0100006902/01/$_filename-deb.$_pkgext")
sha256sums=('bec7bb37ce410ea1418a52526f9f7c0e0626979819ce6f7992ef245b37da7dd3')

prepare() {
  local _pkgarch=$(echo -n "${CARCH}" | sed 's/x86_/amd/' | sed 's/i6/i3/')
  local _debdir="${_filename}-deb/packages"
  bsdtar -xf "${_debdir}/${_filename/-/_}_${_pkgarch}.deb" "data.tar.gz"
}

package() {
  bsdtar -C "$pkgdir" -xzf data.tar.gz
  mkdir -pm755 "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/share/doc/cnijfilter2"/LICENSE* "$pkgdir/usr/share/licenses/$pkgname/"
}
