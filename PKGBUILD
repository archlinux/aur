# Maintainer: Matthias Loibl <mail at matthiasloibl dot com>

_pkgname=archsecure
_gourl="github.com/metalmatze"
pkgname=archsecure-git
pkgver=r11.3e2872c
pkgrel=1
pkgdesc='Check you machine for issues posted on https://security.archlinux.org'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://github.com/metalmatze/archsecure'
license=('GPLv3')
depends=('git' 'go>=1.6' 'pacman')
makedepends=('go>=1.6' 'git')
source=('git://github.com/metalmatze/archsecure.git')
sha256sums=('SKIP')
provides=('archsecure')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/go/src/${_gourl}/${_pkgname}"
  mv "${srcdir}/${_pkgname}" "${srcdir}/go/src/${_gourl}"

  export GOPATH="$srcdir/go"

  cd ${srcdir}/go/src/${_gourl}/${_pkgname}
  go build -o archsecure
}

package() {
  install -Dm755 "${srcdir}/go/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
