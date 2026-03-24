#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=appmenu-gtk-module-wayland
pkgver=0.0.0
pkgrel=1
pkgdesc="GTK3 global menu on plasma wayland."
arch=(any)
url=https://github.com/guiodic/appmenu-gtk-module-wayland
license=('GPL-3.0-only')
depends=(libdbusmenu-gtk3)
makedepends=(cmake)
optdepends=(
  kwayland
)
options=('!strip')

source=(
  "${url}/archive/refs/heads/master.zip"
  appmenu-gtk-module-wayland.sh
)
sha256sums=(
  'SKIP'
  'SKIP'
)

#export CFLAGS="$CFLAGS -O2"
#export LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
#prepare() {
#    cd "$pkgname-master"
#  sed -i -e "s|project('appmenu-gtk-module'|project('appmenu-gtk-module-wayland'|" \
#    -e "58alib_search_path = [meson.current_source_dir() / 'libs']" \
#    meson.build
#  meson setup build .
#}

build() {
    cd "$pkgname-master"
    cmake -B build .
    #meson compile -C build
    cmake --build build
}

package() {
    install -D $pkgname-master/build/libappmenu-gtk-module-wayland.so $pkgdir/usr/lib/gtk-3.0/modules/libappmenu-gtk-module-wayland.so
    install -Dm755 ${pkgname}.sh $pkgdir/etc/profile.d/${pkgname}.sh
}
