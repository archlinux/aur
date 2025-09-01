# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
_pkgname=linux-wifi-hotspot
pkgname=${_pkgname}-git
pkgver=r584.34fd80f
pkgrel=1
pkgdesc="Feature-rich wifi hotspot creator"
arch=('x86_64' 'aarch64')
url="https://github.com/lakinduakash/linux-wifi-hotspot"
license=('BSD-2-Clause')

depends=(
  'glib2'
  'glibc'
  'libpng'
  'bash'
  'libx11'
  'hicolor-icon-theme'
  'gcc-libs'
  'gtk3'
  'hostapd'
  'iproute2'
  'iw'
  'procps-ng'
  'qrencode'
)
optdepends=(
  "dnsmasq: For 'NATed' or 'None' Internet sharing method"
  "iptables: For 'NATed' or 'None' Internet sharing method"
  'haveged: For random MAC generation'
  'wireless_tools: if iw cannot recognize your adapter'
)
makedepends=( 'git' 'make' )

provides=('wihotspot' 'create_ap' 'linux-wifi-hotspot')
conflicts=('wihotspot' 'create_ap' 'linux-wifi-hotspot' 'linux-wifi-hotspot-bin')

backup=('etc/create_ap.conf')

install="$_pkgname.install"

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
