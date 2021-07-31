# Maintainer: dreieck

_pkgname=dropbear-openrc
pkgname="${_pkgname}-git"
_pkgver="latest"
pkgver=2020.81.r0
pkgrel=2
pkgdesc='OpenRC init script and conf.d file for dropbear.'
url='http://pkgs.alpinelinux.org/package/edge/main/x86/dropbear-openrc'
license=('custom: dropbear')
arch=('any')
depends=('dropbear')
makedepends=()
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/conf.d/dropbear')
options=('!emptydirs')
source=(
  "dropbear.initd::https://git.alpinelinux.org/cgit/aports/plain/main/dropbear/dropbear.initd"
  "dropbear.confd::https://git.alpinelinux.org/cgit/aports/plain/main/dropbear/dropbear.confd"
  "LICENSE::https://github.com/mkj/dropbear/raw/master/LICENSE"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  curl -s -L "${url}" | sed -E -n 's|^.*'"${_pkgname}"'-(.*)\.log.*$|\1|p' | tr '-' '.'
}

package() {
  install -D -v -m755 "${srcdir}/dropbear.initd" "${pkgdir}/etc/init.d/dropbear"
  install -D -v -m644 "${srcdir}/dropbear.confd" "${pkgdir}/etc/conf.d/dropbear"
  install -D -v -m644 "${srcdir}/LICENSE"        "${pkgdir}/usr/share/licenses/dropbear/LICENSE"
}
