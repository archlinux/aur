# Maintainer: haagch
# Maintainer: Tinxy <arch at tinx dot eu>
# Contributor: onny <onny at project-insanity dot org>


pkgname=pidgin-opensteamworks-git
pkgver=1.6.1.r52.gbf7dd28
pkgrel=1
pkgdesc="A plugin to connect to Steam Friends/Steam IM (purple plugin). "
url='https://github.com/EionRobb/pidgin-opensteamworks'
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('subversion' 'nss' 'libgnome-keyring')
depends=('libpurple' 'json-glib')
source=('pidgin-opensteamworks::git+https://github.com/EionRobb/pidgin-opensteamworks.git'
        'steam.svg')
sha512sums=('SKIP'
            '34bfdf6f92cd00f9a7812d6c297d552bb05679d619ed41d4416f45043e07554d83d6fb8dcdf9361a311349e776dede2aa48b75dd208f69faf9e5638860ceab61')
replaces=("pidgin-opensteamworks-svn") #google code repo will not be updated
conflicts=("pidgin-opensteamworks")

pkgver() {
  cd "$srcdir/pidgin-opensteamworks/steam-mobile"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/pidgin-opensteamworks/steam-mobile"
  make
}

package() {
  cd "$srcdir/pidgin-opensteamworks/steam-mobile"
  #installing purple plugin
  install -Dm755 libsteam.so "$pkgdir/usr/lib/purple-2/libsteam.so"
  #installing icons
  install -Dm644 steam16.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/16/steam.png"
  install -Dm644 steam22.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/22/steam.png"
  install -Dm644 steam48.png "$pkgdir/usr/share/pixmaps/pidgin/protocols/48/steam.png"
  install -Dm644 "$SRCDEST/steam.svg" "$pkgdir/usr/share/pixmaps/pidgin/protocols/scalable/steam.svg"
}
