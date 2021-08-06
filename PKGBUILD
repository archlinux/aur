# Maintainer: dreieck

_pkgname=dropbear-openrc
pkgname="${_pkgname}"
pkgver=2020.81.r0
pkgrel=2
pkgdesc='OpenRC init script and conf.d file for dropbear.'
url='http://pkgs.alpinelinux.org/package/edge/main/x86/dropbear-openrc'
# For package updates, see also https://git.alpinelinux.org/aports/tree/main/dropbear?h=master
license=('GPL2')
arch=('any')
depends=('dropbear')
makedepends=()
provides=("${_pkgname}=${pkgver}")
replaces=(
  "${_pkgname}-latest<=${pkgver}"
  "${_pkgname}-git<=${pkgver}"
)
conflicts=(
  "${_pkgname}-latest"
  "${_pkgname}-git"
)
backup=('etc/conf.d/dropbear')
options=('!emptydirs')
source=(
  'dropbear.initd::https://git.alpinelinux.org/aports/plain/main/dropbear/dropbear.initd?id=0ba453a872ca49670ba1938757aafa4beaff2453'
  'dropbear.confd::https://git.alpinelinux.org/aports/plain/main/dropbear/dropbear.confd?id=0ba453a872ca49670ba1938757aafa4beaff2453'
)
sha256sums=(
  '563a7f31e081f47418a45102b470d6754448ce421c28a48f0fdcf703046d5aa7'
  'e891255a49d408eb11514662faa4d724a1df27cc2ee90268507dbd2573b67334'
)

pkgver() {
  curl -s -L "${url}" | sed -E -n 's|^.*'"${_pkgname}"'-(.*)\.log.*$|\1|p' | tr '-' '.'
}

package() {
  install -D -v -m755 "${srcdir}/dropbear.initd" "${pkgdir}/etc/init.d/dropbear"
  install -D -v -m644 "${srcdir}/dropbear.confd" "${pkgdir}/etc/conf.d/dropbear"
}
