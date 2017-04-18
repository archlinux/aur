# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
# http://github.com/fukawi2/aur-packages
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=dump
pkgver=0.4b46
pkgrel=1
pkgdesc="Standard *nix for performing backups to tapedrive from ext2 and ext3 filesystems"
arch=('i686' 'x86_64')
url="http://dump.sourceforge.net/"
license=('BSD')
depends=('e2fsprogs')
makedepends=('autoconf' 'automake' 'pkg-config')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('4c463f797e7e8a1112fabf5cbf8e1855')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-manowner=root \
    --with-mangrp=root \
    --with-manmode=644 \
    --with-bingrp=root \
    --disable-readline \
    --disable-rmt \
    --disable-transselinux

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  
  make prefix="$pkgdir"/usr install

  # the upstream Makefile doesn't care for --sbindir to work with
  # prefix=$pkgdir so manhandle /usr/sbin to /usr/bin
  mv -f "$pkgdir"/usr/sbin/ "$pkgdir"/usr/bin

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/dump/COPYING
}

# vim:set ts=2 sw=2 et:
