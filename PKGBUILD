# Maintainer: vinszent <vinszent@vinszent.com>

pkgname=gnome-twitch-git
pkgver=r923.7eb89a1
pkgrel=1
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'webkit2gtk' 'libpeas' 'gobject-introspection')
conflicts=('gnome-twitch')
source=("$pkgname::git+https://github.com/vinszent/gnome-twitch.git")
md5sums=('SKIP')

pkgver()
{
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$pkgname"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --libdir lib --buildtype release ..
  ninja
}

package()
{
  cd "$pkgname/build"
  DESTDIR="$pkgdir" ninja install
}
