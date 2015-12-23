# Maintainer: Daniel T. Borelli < daltomi at aol >

pkgbase=moc_notify-git
pkgname=$pkgbase
pkgver=0.3
pkgrel=1
pkgdesc="Notifier for 'Music On Console' using libnotify."
arch=('i686' 'x86_64')
url='https://github.com/daltomi/moc_notify'
license=('GPL3')
depends=('gtk2' 'libnotify' 'moc')
makedepends=('git' 'cmake')
_gitroot=$url.git
_gitname=moc_notify

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  git clone "$_gitroot" --branch "v.$pkgver"
}

build() {
  src_git=$srcdir/$_gitname/
  msg "Starting build..."
  cd $src_git/
  cmake -DCMAKE_BUILD_TYPE="release" . && make 
}

package() {
  install -Dm755 "$srcdir/$_gitname/moc_notify" "$pkgdir/usr/bin/moc_notify"
}
