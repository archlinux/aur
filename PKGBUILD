# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>

_pkgname=ext4fuse
_github_addr=gerard/ext4fuse
pkgname=$_pkgname-git
pkgver=v0.1.r55.gba01a66
pkgrel=1
pkgdesc="EXT4 implementation for FUSE"
arch=('i686' 'x86_64')
license=('GPL2')
url='https://github.com/gerard/ext4fuse'
depends=('glibc' 'fuse')
makedepends=('git')
source=("$_pkgname"::"git+https://github.com/$_github_addr")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$_pkgname"

    make
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 ext4fuse "$pkgdir"/usr/bin/ext4fuse
}

