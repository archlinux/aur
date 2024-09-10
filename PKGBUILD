# Maintainer : Greg Aluise <galuise@giantg.net>
# Contributer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
# Contributer: Aviana Cruz <gwencroft@proton.me>

pkgname="droidcam-obs-plugin"
pkgver="2.3.3"
pkgrel="2"
pkgdesc="plugin for droidcam obs"
arch=("x86_64" "i686")
url="https://dev47apps.com/obs/"
_tag="b931e2569ff6208eb6bb9c9c3f5723b2956cc63d"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
depends=("obs-studio" 'libusbmuxd' 'libjpeg-turbo' 'libimobiledevice')
makedepends=('git')
conflicts=("${pkgname}-git")
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}#tag=${_tag}" "fixes.patch")
sha256sums=('SKIP' 'a355e7712ad5d6c34e6d1e7c4ce4d99048330907f24bda30c8bf1afd2c45837e')


prepare() {
    cd "$srcdir/$pkgstem"
    patch -p1 -i "$srcdir/fixes.patch"
    mkdir -p build
}

build() {
    cd "$srcdir/$pkgstem"
	 pwd
    make LIBUSBMUXD_DYN_NAME=libusbmuxd-2.0 LIBIMOBILEDEV_DYN_NAME=libimobiledevice-1.0 ALLOW_STATIC=no
}

package() {
    mkdir -p "$pkgdir/usr/lib/obs-plugins"
    cp "$srcdir/$pkgstem/build/droidcam-obs.so" "$pkgdir/usr/lib/obs-plugins/"
    mkdir -p "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs"
    cp -r "$srcdir/$pkgstem/data/locale" "$pkgdir/usr/share/obs/obs-plugins/droidcam-obs/"
}
