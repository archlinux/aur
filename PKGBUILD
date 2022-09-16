# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
# Contributer: Aviana Cruz <gwencroft@proton.me>

pkgname="droidcam-obs-plugin"
pkgver="1.6.0"
pkgrel="1"
pkgdesc="plugin for droidcam obs"
arch=("x86_64" "i686")
url="https://dev47apps.com/obs/"
srcurl="https://github.com/dev47apps/droidcam-obs-plugin.git"
license=('GPL')
groups=()
depends=("obs-studio" 'libusbmuxd')
makedepends=('libjpeg-turbo')
optdepends=()
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${srcurl}#tag=${pkgver}" "fix_Makefile.patch")
noextract=()
sha256sums=('SKIP' 'SKIP')


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
