# Maintainer: Salamandar <felix@piedallu.me>

pkgname=livewallpaper
pkgdesc="OpenGL powered animated wallpapers with configuration utility, autostart, and application indicator."
url="https://launchpad.net/livewallpaper"
license=('GPL3')

pkgver=0.5.0.r333
pkgrel=1
arch=('x86_64' 'i686')

makedepends=(
    'bzr' 'cmake' 'ninja' 'vala' 'intltool' 'xcftools'
)
depends=(
    'libpeas' 'upower' 'libappindicator-gtk3' 'gobject-introspection'
    'python' 'python-cairo' 'python-opengl' 'glew'
)

source=(
    "${pkgname}"::'bzr+https://launchpad.net/livewallpaper/trunk'
)

sha256sums=(
    'SKIP'
)

pkgver() {
  cd "${pkgname}"
  bzr tags | sort -n -k1 | sed 's/.*-//g'| awk -v REV="$(bzr revno)" 'END { printf("%s.r%s\n", $1, REV-$3) }'
}

build() {
    cd "${pkgname}"
    mkdir "build" -p
    cd    "build"

    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..

    ninja
}

package() {
    cd "${pkgname}"
    cd "build"

    DESTDIR="${pkgdir}" ninja install
}
