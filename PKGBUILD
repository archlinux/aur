# Maintainer:  Mort Yao <soi@mort.ninja>
# Contributor: Ismael Barros² (RazZziel) <razielmine@gmail.com>

pkgname=emacs-android-git
pkgver=20150609
pkgrel=1
pkgdesc="Emacs minor mode for Android application development"
arch=('any')
url="http://github.com/remvee/android-mode/"
license=('GPL3')
depends=('emacs')
makedepends=('git')
install=$pkgname.install
source=()
md5sums=()

_gitroot="git://github.com/remvee/android-mode.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  install -d $pkgdir/usr/share/emacs/site-lisp/
  install android-mode.el $pkgdir/usr/share/emacs/site-lisp/
}
