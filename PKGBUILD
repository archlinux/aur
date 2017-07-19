# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Sebastian Ullrich <echo c2ViYXN0aUBudWxscmkuY2gK|base64 -d>
# Contributor: lishengming.zju <lishengming.zju@gmail.com>

pkgname=('pidgin-hg') #'libpurple-hg' 'finch-hg')
_hgname=pidgin
pkgver=3.r38592.7e4936454df2
pkgrel=1
provides=("pidgin" "libpurple" "finch")
conflicts=("pidgin" "libpurple" "finch")
pkgdesc="Multi-protocol instant messaging client. Latest mercurial build."
arch=('i686' 'x86_64')
url="http://pidgin.im/"
license=('GPL')
depends=('meanwhile' 'farstream' 'libsasl' 'libidn' 'dbus-glib' 'nss'
  'libgnome-keyring' 'startup-notification' 'gtkspell' 'libxss' 'libsm'
    'hicolor-icon-theme' 'dbus-glib' 'webkitgtk3' 'json-glib')
optdepends=('avahi: Bonjour protocol support'
    'ca-certificates: SSL CA certificates'
    'python-dbus: for purple-remote and purple-url-handler'
    'tk: Tcl/Tk scripting support'
    'aspell: for spelling correction')
makedepends=('mercurial' 'python2' 'avahi' 'tk' 'ca-certificates' 'intltool'
             'tk' 'ca-certificates' 'intltool' 'networkmanager'
             'startup-notification' 'gtkspell' 'libxss' 'libsm'
             'hicolor-icon-theme' 'dbus-glib' 'webkitgtk' 'json-glib'
             'farstream' 'libsasl' 'libidn' 'dbus-glib' 'nss'
             'libgnome-keyring' 'gplugin')
makedepends+=('libx11' 'meson')
options=('!libtool')
source=('pidgin::hg+https://bitbucket.org/pidgin/main#branch=default')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/pidgin

  printf "3.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir"/"$_hgname"
  rm -rf ../build
  mkdir ../build
  NOCONFIGURE=1 ./autogen.sh
} 

build() {
  cd "$srcdir"/build
   meson ../pidgin -Dsilc=false --prefix=/usr
  ninja
}

package(){
  cd "$srcdir"/build

  # For linking
  DESTDIR=$pkgdir ninja install

}

