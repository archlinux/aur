# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
gitname=cassette
pkgname=cassette-dev
pkgver=0.2.0.20240517
pkgrel=1
pkgdesc="GTK4/Adwaita приложение, которое позволит вам использовать Я.Музыку на Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/rirusha/${gitname}"
license=('GPL3')
depends=('glib2' 'gtk4' 'libgee' 'libadwaita' 'libsoup3' 'json-glib' 'sqlite3' 'libxml2' 'gstreamer' 'webkitgtk-6.0' 'gst-plugins-good' ) 
optdepends=()
makedepends=('meson' 'ninja' 'cmake' 'blueprint-compiler' 'gcc' 'git' 'vala'  'appstream-glib' 'python-packaging')
provides=("$gitname")
conflicts=("$gitname")
source=("git+${url}.git")
md5sums=('SKIP')
options=('strip')

build() {
    cd "${gitname}/"
    sudo pacman -Ud --noconfirm https://archive.archlinux.org/packages/g/gcc-libs/gcc-libs-13.2.1-6-x86_64.pkg.tar.zst
    sudo pacman -Ud --noconfirm https://archive.archlinux.org/packages/g/gcc/gcc-13.2.1-6-x86_64.pkg.tar.zst
    meson . builddir --prefix=/usr
    meson configure -Dprofile=development builddir
    meson compile -C builddir
}

package() {
    cd "${gitname}/"
    meson install -C builddir --destdir "$pkgdir"
    sudo pacman -S --noconfirm  gcc-libs gcc
}

