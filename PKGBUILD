# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

set -u
_pkgname='dropbox-uploader'
pkgname="${_pkgname}-git"
pkgver=0.15c.r0.g43e32ae
pkgrel=1
pkgdesc='A bash script to manage Dropbox from the CLI'
arch=('any')
#url='https://github.com/andreafabrizi/Dropbox-Uploader'
url='https://github.com/severach/Dropbox-Uploader'
license=('GPL3')
depends=('bash' 'curl')
makedepends=('git')
#source=('git://github.com/andreafabrizi/Dropbox-Uploader.git')
source=('git://github.com/severach/Dropbox-Uploader.git')
sha256sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")

pkgver() {
  set -u
  cd "${srcdir}/Dropbox-Uploader"
  git describe --tags --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
  set +u
}

prepare() {
  set -u
  cd "${srcdir}/Dropbox-Uploader"
  sed -i -e 's/dropbox_uploader.sh/dropbox_uploader/g' 'dropShell.sh'
  set +u
}

package() {
  set -u
  cd "${srcdir}/Dropbox-Uploader"
  install -Dpm755 'dropbox_uploader.sh' "${pkgdir}/usr/bin/dropbox_uploader"
  install -Dpm755 'dropShell.sh' "${pkgdir}/usr/bin/dropShell"
  set +u
}
set +u
