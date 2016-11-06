# Maintainer: Benedikt Heine <bebe@bebehei.de>

# Based on work of original synapse PKGBUILD from:
# - Felix Yan <felixonmars@archlinux.org>
# - Alessio Sergi <asergi at archlinux dot us>

_bzr_branch=trunk
_pkgname=synapse

pkgname=$_pkgname-bzr
pkgver=r653
pkgrel=1
pkgdesc="A semantic file launcher"
arch=('i686' 'x86_64')
url="https://launchpad.net/synapse-project"
license=('GPL3')

conflicts=(
           "$_pkgname"
          )

depends=(
         'libkeybinder3'
         'hicolor-icon-theme'
         'json-glib'
         'libgee'
         'libnotify'
         'zeitgeist'
         'rest'
         'xdg-utils'
        )
makedepends=(
             'intltool'
             'vala'
            )
optdepends=(
            'banshee: banshee plugin'
            'bc: calculator plugin'
            'devhelp: documentation plugin'
            'gnome-screensaver: screensaver plugin'
            'gnome-dictionary: dictionary plugin'
            'openssh: ssh plugin'
            'pastebinit: pastebin plugin'
            'rhythmbox: rhythmbox plugin'
            'xnoise: xnoise plugin'
           )

source=(
        "$_pkgname::bzr+http://bazaar.launchpad.net/~$_pkgname-core/$_pkgname-project/$_bzr_branch/"
       )
sha1sums=(
          'SKIP'
         )

pkgver() {
  cd "$_pkgname"
  printf "r%s" "$(bzr revno)"
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
