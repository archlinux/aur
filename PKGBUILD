# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=epiphany
pkgname=$_pkgname-git
pkgver=3.16.1.6.ga966acc
pkgrel=1
_realver=3.16.1
install=epiphany.install
pkgdesc="A GNOME web browser based on the WebKit rendering engine."
arch=('i686' 'x86_64')
license=('GPL')
depends=("glib2" "gtk3>=3.13.0" "libsoup>=2.48.0" 'libnotify' 'gsettings-desktop-schemas' 'webkit2gtk>=2.7.4' 
		  'nss' 'iso-codes' 'dconf' 'gobject-introspection' 'desktop-file-utils' 'libxml2' 'libsecret'
		  'hicolor-icon-theme' 'gcr' 'gnome-desktop' 'libwnck3' 'avahi')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'git' 'startup-notification' 'yelp-tools')
options=('!libtool' '!emptydirs')
groups=('gnome')
url="http://www.gnome.org/projects/epiphany/"
replaces=('epiphany')
provides=("epiphany=${_realver}")
conflicts=('epiphany')
source=('git://git.gnome.org/epiphany')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  # git bz apply bugzilla.gnome.org:710004
  #  git bz apply bugzilla.gnome.org:729726
  # git bz apply bugzilla.gnome.org:741808
  # git bz apply bugzilla.gnome.org:737085
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-maintainer-mode \
      --disable-deprecations --enable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
