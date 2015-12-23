# Maintainer: Daniel T. Borelli < daltomi at aol >

pkgbase=moc_notify-git
pkgname=$pkgbase
pkgver=0.1
pkgrel=1
pkgdesc="Notifier for 'Music On Console' using libnotify."
arch=('i686' 'x86_64')
url='https://github.com/daltomi/moc_notify'
license=('GPL3')
depends=('gtk2' 'libnotify' 'moc')
makedepends=('git' 'cmake')
_gitroot=$url.git
_gitname=$pkgbase

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" --depth=1 --single-branch "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

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
