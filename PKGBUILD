# Maintainer: Morten Linderd <morten@linderud.pw>

pkgname=cubemap
pkgver=1.3.2
pkgrel=3
_commit=dcaac16b8d823bc0b1bf0ce45a99bba68f03553c
pkgdesc="A scalable video reflector, designed to be used with VLC."
arch=(x86_64)
url="https://git.sesse.net/?p=cubemap"
license=('GPL2')
depends=('protobuf' 'libsystemd')
makedepends=('systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sesse.net/?p=cubemap;a=snapshot;h=${_commit};sf=tgz")
sha256sums=('09c34d77f27c4e116f9cfedd2511a836137189f887fcc819b0930bffaf43eaab')

build() {
  cd "${pkgname}"-"${_commit:0:7}"
  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"-"${_commit:0:7}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
