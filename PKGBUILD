# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=znc-palaver-git
_gitname=znc-palaver
pkgver=r96.825cb68
pkgrel=1
pkgdesc="Palaver ZNC module provides push notifications"
arch=('i686' 'x86_64')
url="git://github.com/cocodelabs/znc-palaver"
license=('MIT')
depends=('znc')
source=("git+https://github.com/cocodelabs/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  make
}

package() {
  cd "${_gitname}"
  install -d -m750 "${pkgdir}/var/lib/znc"
  install -d -m700 "${pkgdir}/var/lib/znc/.znc"
  install -D -m644 palaver.so "${pkgdir}/var/lib/znc/.znc/modules/palaver.so"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
