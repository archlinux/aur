# Maintainer: Xyne <ca archlinux xyne, backwards>
_pkgname=jme
pkgname=jme-git
pkgver=1329935374
pkgrel=1
pkgdesc="JMicron Ethernet Linux driver"
arch=('i686' 'x86_64')
url="http://bbs.cooldavid.org/git/?p=jme.git"
license=('GPL')
makedepends=('git' 'linux-headers')
provides=('jme')
conflicts=('jme')
install="$pkgname".install

source=('git://bbs.cooldavid.org/jme.git#branch=master' 'kernel-3.10.patch')
sha512sums=('SKIP'
            '72c1d51afea066df405a7e0ade6ac3313664538349819ab869be1c1050e3a4cb6fa88f503332b046d58903ae8b51f21cfccdd57cd6b0d38320bb6e1d68bc5cd8')

pkgver() {
  cd -- "$srcdir/$_pkgname"
  git log -n1 --pretty=format:%ct
}

prepare() {
  cd -- "$srcdir/$_pkgname"
  git apply "$srcdir/kernel-3.10.patch"
}

build() {
  cd -- "$srcdir/$_pkgname"
  make -j1
  gzip jme.ko
}

package() {
  cd -- "$srcdir/$_pkgname"
  install -Dm644 jme.ko.gz "$pkgdir"/lib/modules/"$(uname -r)"/updates/jme.ko.gz
  install -Dm644 jme.h "$pkgdir"/usr/include/jme.h
}

# vim:set ts=2 sw=2 et:
