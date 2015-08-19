# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Marti Raudsepp <marti@juffo.org>
pkgname=udev-browse-git
pkgver=0.3.r0.g7ba128e
pkgrel=1

pkgdesc="Graphical browser for the Linux sysfs device tree"
url=http://0pointer.de/blog/projects/udev-browse.html
arch=('i686' 'x86_64')
license=('LGPL')

depends=('udev' 'libgee' 'gtk3')
makedepends=('vala' 'git')

source=($pkgname::git://git.0pointer.de/udev-browse.git
	udev-browse.desktop)
sha256sums=('SKIP'
            '2e6168eec25a8107a2a825ccb7b9081dd0eaf633b67ec3cbafc1f204261dc688')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd "$pkgname"
  sed -i 's/gee-1.0/gee-0.8/' Makefile
  sed -i 's/ListStore/Gtk.ListStore/' udev-browse.vala
  make
}

package() {
  cd "$pkgname"
  install -Dm755 udev-browse "$pkgdir"/usr/bin/udev-browse
  install -Dm644 "$srcdir"/udev-browse.desktop \
	  "$pkgdir"/usr/share/applications/udev-browse.desktop
}
