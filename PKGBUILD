# Maintainer: robertfoster

pkgname=partclone-git
pkgver=1468.ee77626
pkgrel=1
pkgdesc="Utilities to save and restore used blocks on a partition"
arch=('i686' 'x86_64')
url="https://partclone.org"
license=('GPL')
depends=('ntfs-3g' 'nilfs-utils')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Thomas-Tsai/${pkgname%-git}.git")

build() {
  cd "${pkgname%-git}"
  ./autogen
  ./configure \
    --prefix=/usr \
    --enable-extfs \
    --enable-fat \
    --enable-hfsp \
    --enable-btrfs \
    --enable-ncursesw \
    --enable-ntfs \
    --enable-exfat \
    --enable-f2fs \
    --enable-minix \
    --enable-nilfs2 \
    --enable-xfs \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname%-git}
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

pkgver() {
  cd ${pkgname%-git}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP')
