# Maintainer:  Nicholas Wang <me#nicho1as.wang>

pkgname=tunasync-git
pkgver=20200917
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA"
arch=('x86_64')
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
replaces=('tunasync-bin')
conflicts=('tunasync-bin')
provides=('tunasync' 'tunasynctl')
source=('tunasync::git+https://github.com/tuna/tunasync#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/tunasync
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}"/tunasync
  make
}

package() {
  install -Dm755 "${srcdir}"/tunasync/build-linux-amd64/tunasync "${pkgdir}"/usr/bin/tunasync
  install -Dm755 "${srcdir}"/tunasync/build-linux-amd64/tunasynctl "${pkgdir}"/usr/bin/tunasynctl
}
