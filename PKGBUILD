# Maintainer: Brendan Van Hook <brendan at vastactive dot com>
_pkgname=rehackable_scripts
pkgname=${_pkgname}-git
pkgver=r76.200668e
pkgrel=1
pkgdesc='A set of bash scripts to interact with the reMarkable tablet.'
arch=('any')
url='https://github.com/reHackable/scripts'
license=('GPLv3')
depends=('openssh' 'curl' 'netcat')
optdepends=()
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/reHackable/scripts")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/${_pkgname}/host"
  install -D -m755 reclean.sh "${pkgdir}/usr/bin/reclean.sh"
  install -D -m755 repull.sh "${pkgdir}/usr/bin/repull.sh"
  install -D -m755 repush.sh "${pkgdir}/usr/bin/repush.sh"
  install -D -m755 retext.sh "${pkgdir}/usr/bin/retext.sh"
  install -D -m755 rezone.sh "${pkgdir}/usr/bin/rezone.sh"
}
