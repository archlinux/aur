# Contributor: Manalishi <manalishi at freenet dot de>
# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

_pkgname=cbmbasic
pkgname=cbmbasic-git
pkgver=0.r17.89093eb
pkgrel=1
pkgdesc="A 100% compatible version of Commodore's version of Microsoft BASIC 6502"
arch=('i686' 'x86_64')
url='https://github.com/mist64/cbmbasic/'
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('cbmbasic')
conflicts=('cbmbasic')
source=("${_pkgname}"::'git+https://github.com/mist64/cbmbasic.git'
        'license')
md5sums=('SKIP'
         '75bfb930010784e9cacecac750607738')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}"

  install -Dm755 "${_pkgname}"/cbmbasic "${pkgdir}"/usr/bin/cbmbasic
  install -dm755 "${pkgdir}"/usr/share/"${_pkgname}"
  install -m644 "${_pkgname}"/test/*.bas "${pkgdir}"/usr/share/"${_pkgname}"
  install -Dm644 license "${pkgdir}"/usr/share/licenses/"${_pkgname}"/license
}
