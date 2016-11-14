set -u
pkgname='lrun-json'
_pkgname='lrun'
pkgver='1.1.5'
pkgrel='1'
pkgdesc='Run command on Linux with resources limited.'
url="https://github.com/lackofdream/${_pkgname}"
arch=('i686' 'x86_64')
license=('MIT')
depends=('linux>=2.6.26')
optdepends=('libseccomp>=2.0')
makedepends=('gcc>=4.4' 'pkg-config' 'ruby')
conflicts=('lrun')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/lackofdream/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('cd451ac28afcb31ac1b20241ad47cdf8cf7dbd221bc0abd0ee83c956eb82a771')
install="${_pkgname}.install"

prepare() {
  set -u
  pkg-config --max-version 2.9 libseccomp || echo 'libseccomp 1.x or 2.x not found, syscall filter will not work'
  set +u
}

build() {
  set -u
  cd "${_pkgname}-${pkgver}/src/"
  #rake
  PREFIX="${pkgdir}/usr" rake
  set +u
}

package() {
  set -u
  cd "${_pkgname}-${pkgver}/src/"
  install -Dpm4550 -oroot -g 593 -s 'lrun' -t "${pkgdir}/usr/bin/"

  install -Dpm644 '../LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
