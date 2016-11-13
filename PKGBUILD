# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mlibtool-git
pkgver=r30.9ac89ba
pkgrel=1
pkgdesc="libtool accelerator - replacement for sane systems, frontend for others"
url="https://github.com/GregorR/mlibtool"
arch=('i686' 'x86_64')
license=('ISC')
depends=('glibc' 'sh')
source=("git+https://github.com/GregorR/mlibtool.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C ${pkgname%-*}
}

package() {
  cd ${pkgname%-*}

  # binary and script
  install -d "$pkgdir"/usr/bin
  install -m0755 mlibtool acmlibtool "$pkgdir"/usr/bin
  # data
  install -Dm0755 nomlibtool.sh "$pkgdir"/usr/share/$pkgname/nomlibtool.sh
  cp -rL autotools-template "$pkgdir"/usr/share/$pkgname
  # doc
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  # licence
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  sed -n '/Copyright (c)/,/OF THIS SOFTWARE./p' mlibtool.c > \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
