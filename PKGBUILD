# Maintainer : Greg Aluise <galuise@giantg.net>
# Contributer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
# Contributer: Aviana Cruz <gwencroft@proton.me>

pkgname="droidcam-obs-plugin"
pkgver="2.3.2"
pkgrel="1"
pkgdesc="plugin for droidcam obs"
arch=("x86_64" "i686")
url="https://dev47apps.com/obs/"
_tag="bc8b045c0a67a2f62f1f98bd537112cbc89881e3"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
depends=("obs-studio" 'libusbmuxd' 'libjpeg-turbo' 'libimobiledevice')
makedepends=('git')
conflicts=("${pkgname}-git")
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}#tag=${_tag}" "fix_Makefile.patch")
sha256sums=('SKIP' '23f06a6105cd953681fd72415137e81231faa254105ccb07c25685b8c43e059a')


prepare() {
    cd "$srcdir/$pkgstem"
    patch -p1 -i "$srcdir/fix_Makefile.patch"
    mkdir -p build
}

build() {
    cd "$srcdir/$pkgstem"
    make ALLOW_STATIC=no
}

package() {
    mkdir -p "$pkgdir/usr/lib/obs-plugins"
    cp "$srcdir/$pkgstem/build/droidcam-obs.so" "$pkgdir/usr/lib/obs-plugins/"
    mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
    cp -r "$srcdir/$pkgstem/data/locale" "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
