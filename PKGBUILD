# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# <fedor@yu.wildpark.net>

set -u
_pkgbase='lltdscan'
pkgname="${_pkgbase}-git"
pkgver=20130204.r7.g258dbb1
pkgrel=1
pkgdesc='Scan for LLTD-enabled hosts on your network'
arch=('i686' 'x86_64')
url="https://github.com/zed-0xff/${_pkgbase}"
license=('GPL')
depends=('libpcap' 'libnet')
makedepends=('git')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
#_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${url//https:/git:}.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${pkgname%-git}"
  printf '%s.r%s.g%s' "$(git log -1 --format='%ci' | cut -d' ' -f1 | sed -e 's:-::g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

build() {
  set -u
  cd "${pkgname%-git}"
  make -s
  set +u
}

package() {
  set -u
  cd "${pkgname%-git}"
  install -Dpm755 'lltdscan' -t "${pkgdir}/usr/bin/"
  install -Dpm644 'lltdscan.8' -t "${pkgdir}/usr/share/man/man8/"
  set +u
}
set +u
