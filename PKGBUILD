# Maintainer: willemw <willemw12@gmail.com>

pkgname=stickynotes
pkgver=10.02.20
_pkgver_git_commit_sha=0e4e7bae8ab972817c9ab21d0f5cb86b2a357389
pkgrel=8
pkgdesc="Place colourful sticky reminders all over your desktop"
arch=('any')
url="https://github.com/xbot/stickynotes/"
license=('GPL')
depends=('pygtk' 'python2-wnck')
makedeps=('git')
#source=(https://github.com/xbot/stickynotes/archive/$_pkgver_git_commit_sha.zip
source=($pkgname::git+https://github.com/xbot/stickynotes.git#commit=$_pkgver_git_commit_sha
        $pkgname.desktop 
        $pkgname.sh)
md5sums=('SKIP'
         'ccdad6a729fbda6bb116a25666703423'
         '161b98bb2ee7e4f5b6c1fdbed75157aa')

prepare() {
  #cd $pkgname-$_pkg_git_commit_sha
  cd $pkgname
  sed -i 's_#! /usr/bin/python_#!/usr/bin/env python2_' $pkgname.py
}

package() {
  #cd "$srcdir/$pkgname-$_pkg_git_commit_sha"
  cd "$srcdir/$pkgname"
  install -Dm755 stickynotes.py "$pkgdir/usr/share/$pkgname/stickynotes.py"
  install -Dm644 stickynotes.ui "$pkgdir/usr/share/$pkgname/stickynotes.ui"

  #cd "$srcdir/$pkgname-$_pkg_git_commit_sha/icons"
  cd "$srcdir/$pkgname/icons"
  install -Dm644 applet.png "$pkgdir/usr/share/$pkgname/icons/applet.png"
  install -Dm644 overlay.png "$pkgdir/usr/share/$pkgname/icons/overlay.png"
  install -Dm644 trans.png "$pkgdir/usr/share/$pkgname/icons/trans.png"

  cd "$srcdir"
  install -Dm644 stickynotes.desktop "$pkgdir/usr/share/applications/stickynotes.desktop"
  install -Dm755 stickynotes.sh "$pkgdir/usr/bin/stickynotes"
}
