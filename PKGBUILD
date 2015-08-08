# Maintainer: Kirill Malyshev <keryascorpio at gmail.com>
# Contributor: Robert Orzanna <orschiro@googlemail.com>
pkgname=oblogout-fork-git
pkgver=20130106
pkgrel=3
pkgdesc="Openbox Logout Script Fork used by CrunchBang"
arch=('any')
url="https://github.com/Cloudef/oblogout-fork"
depends=('pygtk' 'python2-pillow' 'python2-distutils-extra' 'python2-dbus')
optdepends=('upower')
makedepends=('git')
license=('GPL2')
backup=(etc/oblogout.conf)  
conflicts=('openboxlogout-gnome' 'oblogout')
install=oblogout.install
source=(oblogout.conf
	switch-user.patch)
md5sums=('1e43b3a6ffeaefa0f68152a473259676'
         '86a7a64ae86c0d733f69d37da05eb357')

_gitroot="git://github.com/Cloudef/oblogout-fork.git"
_gitname="oblogout-fork"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --dept=1
  fi

  cd "$srcdir/$_gitname"

  patch -p1 < "$srcdir/switch-user.patch"
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/"
  install -m644 "$srcdir/oblogout.conf" "$pkgdir/etc/"
}

# vim:set ts=2 sw=2 et:
