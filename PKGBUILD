# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sebastian Ullrich <echo c2ViYXN0aUBudWxscmkuY2gK|base64 -d>
# Contributor: lishengming.zju <lishengming.zju@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=('pidgin-hg') #'libpurple-hg' 'finch-hg')
_hgname=pidgin
pkgver=3.r42206.cfa7c940ed62
pkgrel=2
provides=("pidgin" "libpurple" "finch")
conflicts=("pidgin" "libpurple" "finch")
pkgdesc="Multi-protocol instant messaging client. Latest mercurial build."
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('enchant' 'libgadu' 'gplugin-hg' 'gmime3' 'qt5-base'
  'talkatu-hg' 'libgnt3-hg' 'meanwhile' 'farstream'
   'libsasl' 'libidn' 'nss' 'kwallet' 'hasl-hg'
   'libgnome-keyring' 'startup-notification' 'gtkspell'
   'libxss' 'libsm' 'dbus-glib' 'json-glib' 'libadwaita')
optdepends=('avahi: Bonjour protocol support'
    'ca-certificates: SSL CA certificates'
    'python-dbus: for purple-remote and purple-url-handler'
    'tk: Tcl/Tk scripting support'
    'aspell: for spelling correction')
makedepends=('mercurial' 'avahi' 'tk' "gobject-introspection" 'ca-certificates' 'intltool'
             'tk' 'ca-certificates' 'intltool' 'networkmanager'
             'startup-notification' 'gtkspell' 'libxss' 'libsm'
             'hicolor-icon-theme' 'dbus-glib' 'json-glib' 'vala'
             'farstream' 'libsasl' 'gtk-doc' 'nss' 'cmake'
             'libgnome-keyring' 'gi-docgen')
makedepends+=('libx11' 'meson')
options=('!libtool')
source=('pidgin::hg+https://keep.imfreedom.org/pidgin/pidgin#branch=default')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/pidgin

  printf "3.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
   arch-meson pidgin build \
     -Dkwallet=enabled \
     -Ddoc=true \
     -Dunity-integration=disabled \
     -Davahi=enabled \
     -Dlibgadu=enabled

  ninja -C build
}

package(){
  # For linking
  DESTDIR=$pkgdir ninja -C build install

}

