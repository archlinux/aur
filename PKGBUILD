# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jun Wu <quark@zju.edu.cn>

set -u
pkgname='lrun'
pkgver='1.1.4'
pkgrel='1'
pkgdesc='Run command on Linux with resources limited.'
url="https://github.com/quark-zju/${pkgname}"
arch=('i686' 'x86_64')
license=('MIT')
depends=('linux>=2.6.26')
optdepends=('libseccomp>=2.0')
makedepends=('gcc>=4.4' 'pkg-config' 'ruby')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quark-zju/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5365af8fffa0eba0155ef0b6e9467a8c8aa26c5e1737b47d959396eb8b96deb8')
install="${pkgname}.install"

prepare() {
  set -u
  pkg-config --max-version 2.9 libseccomp || echo 'libseccomp 1.x or 2.x not found, syscall filter will not work'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}/src/"
  #rake
  PREFIX="${pkgdir}/usr" rake
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}/src/"
  install -Dpm4550 -oroot -g 593 -s 'lrun' -t "${pkgdir}/usr/bin/"

  install -Dpm644 '../LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
