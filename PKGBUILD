# Maintainer: dreieck

_pkgname=adhocspot-script
pkgname="${_pkgname}-git"
epoch=0
pkgver=20190514.1
pkgrel=2
pkgdesc="Bash script to easily configure your interface to share your internet connection and configure a DHCP and DNS and TFTP boot server to listen on it. IP, DHCP, DNS can be configured, and for WiFi interfaces also wireless mode and encryption."
arch=('any')
license=('custom: Public Domain')
groups=()
depends=(
  "bash"
  "dnsmasq"
  "iptables"
  "net-tools"
  "wireless_tools"
  "wpa_supplicant"
)
makedepends=(
  'git'
)
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}<=${pkgver}")
options=('emptydirs')
install='adhocspot-script.install'
source=(
  "${_pkgname}::git+http://gitea.felics.kettenbruch.de/felics/${_pkgname}.git"
  "adhocspot-script.install"
)
sha256sums=(
  'SKIP'
  "f05052583b9d7ba8215897bc621fea38d18fea20e1040fcbda4fd2ab76fc8867"
)

pkgver() {
  "${srcdir}/${_pkgname}/adhocspot.sh" --version
}

prepare() {
  chmod 755 "${srcdir}/${_pkgname}/adhocspot.sh" # So that pkgver() can execute it.
}

package() {
  cd "${srcdir}/${_pkgname}"

  _licdirbase="/usr/share/licenses/${pkgname}"
  _licdir="${pkgdir}/${_licdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  _rundirbase="/run/adhocspot"
  _rundir="${pkgdir}/${_rundirbase}"

  install -v -D -m755 "adhocspot.sh" "${_execdir}/adhocspot.sh"
  install -v -D -m644 "README.md" "${_docdir}/README.md"
  install -v -D -m644 "copying.txt" "${_licdir}/copying.txt"
  install -v -d -m755 "${_rundir}"
}
