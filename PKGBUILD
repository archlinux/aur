# Contributor: Hieu Hoang <aur@zahe.me>
# Maintainer: Carl Mueller  archlinux at carlm e4ward com
pkgname=boxfs2-static-git
pkgver=0.r91.g338fe2f
pkgrel=1
pkgdesc="Box.com FUSE client based on APIv2, static linked with libapp and libjson"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/drotiro/boxfs2"
license=('GPL3')
depends=('fuse' 'libxml2' 'curl')
makedepends=('git')
conflicts=(boxfs)
source=('git+https://github.com/drotiro/boxfs2.git'
        'git+https://github.com/drotiro/libapp.git'
        'git+https://github.com/vincenthz/libjson.git')
md5sums=(SKIP SKIP SKIP)

pkgver() {
  cd "$srcdir/boxfs2"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/boxfs2"
  ln -s "$srcdir/libapp"
  ln -s "$srcdir/libjson"
  make static
}

package() {
  cd "$srcdir/boxfs2"
  install -D -s boxfs "$pkgdir/usr/bin/boxfs"
  install -D boxfs-init "$pkgdir/usr/bin/boxfs-init"
}

# vim:set ts=2 sw=2 et:
