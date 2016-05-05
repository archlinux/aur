# Maintainer : M0Rf30

pkgname=partclone-git
pkgver=1031.bc86797
pkgrel=1
pkgdesc="PUtilities to back up and restore used-blocks of a partition."
arch=('i686' 'x86_64')
url="http://partclone.nchc.org.tw/"
license=('GPL')
depends=('progsreiserfs' 'ntfs-3g' 'nilfs-utils')
makedepends=('git')
provides=('partclone')
conflicts=('partlcone')
source=('partclone::git+https://github.com/Thomas-Tsai/partclone.git')

build() {
  cd partclone
  autoreconf
  
  ./configure --prefix=/usr --enable-extfs --enable-reiserfs --enable-fat \
    --enable-hfsp --enable-btrfs --enable-ncursesw --enable-ntfs \
    --enable-exfat --enable-f2fs --enable-minix --enable-nilfs2 --enable-xfs \
    --sbindir=/usr/bin

  make
}

package() {
  cd partclone
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd partclone
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
