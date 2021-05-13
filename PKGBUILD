# Maintainer: Frederic Bezies <fredbezies at gmail.com>

# Based on work of original synapse PKGBUILD from:
# - Felix Yan <felixonmars@archlinux.org>
# - Alessio Sergi <asergi at archlinux dot us>
# An on synapse-bzr by Benedikt Heine <bebe@bebehei.de>

_pkgname=synapse

pkgname=$_pkgname-git
pkgver=0.2.99.4.r2.g61f8fb8
pkgrel=1
pkgdesc="A semantic file launcher"
arch=('i686' 'x86_64')
url="https://launchpad.net/synapse-project"
license=('GPL3')
conflicts=("$_pkgname")
depends=('libkeybinder3' 'libappindicator-gtk3' 'libgee' 'libnotify' 'zeitgeist')
makedepends=('intltool' 'vala')
optdepends=('banshee: banshee plugin'
            'bc: calculator plugin'
            'devhelp: documentation plugin'
            'gnome-screensaver: screensaver plugin'
            'gnome-dictionary: dictionary plugin'
            'openssh: ssh plugin'
            'pastebinit: pastebin plugin'
            'rhythmbox: rhythmbox plugin'
            'xnoise: xnoise plugin')

source=("$_pkgname::git://git.launchpad.net/synapse-project")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}
