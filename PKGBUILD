# Maintainer: jjacky
_pkgname=kalu
pkgname=$_pkgname-git
pkgver=4.3.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news [GIT]"
arch=('i686' 'x86_64')
url="https://jjacky.com/$_pkgname"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=5.1' 'pacman<5.2' 'curl' 'libnotify'
         'notification-daemon')
makedepends=('perl' 'groff' 'git' 'autoconf')
source=("git+https://github.com/jjk-jacky/${_pkgname}.git#branch=next")
install=kalu.install
md5sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --abbrev=4 --dirty | tr - .
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --enable-git-version
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  chmod 750 "$pkgdir"/usr/share/polkit-1/rules.d
  chown 0:102 "$pkgdir"/usr/share/polkit-1/rules.d
}

# vim:set ts=2 sw=2 et:
