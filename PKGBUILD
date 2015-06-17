# Maintainer: Phillip Wood <phillip.wood@dunelm.org.uk>
pkgname='gnome-break-timer-git'
_pkgname=${pkgname%-git}
pkgver=1
pkgrel=1
epoch=
pkgdesc="The new typing break for GNOME, (replaces gnome-typing-break-bzr & drwright)"
arch=('x86_64' 'i686')
url='https://wiki.gnome.org/GnomeBreakTimer'
license=('GPL3')
groups=()
depends=('libnotify' 'libcanberra' 'libgee06' 'json-glib' 'libxtst' 'gtk3')
makedepends=('vala' 'git' 'intltool')
checkdepends=()
optdepends=()
provides=()
conflicts=('gnome-typing-break-bzr')
replaces=('gnome-typing-break-bzr')
backup=()
options=(!makeflags)
install="$pkgname.install"
changelog=
source=("git://git.gnome.org/gnome-break-timer.git"
        "$pkgname.install")
noextract=()
sha256sums=('SKIP'
            'b9f8bdaa058b458951112febd3210674a78cf8cbd1fa48ef6b166ccd55603da8') 
pkgver() {
  cd $srcdir/$_pkgname
  echo $(git describe | sed 's#-#_#g;s#v##')
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh --prefix=/usr --sysconfdir=/etc \
	  --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
	  --disable-static --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
