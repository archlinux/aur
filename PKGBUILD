# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
gitname=cassette
pkgname=("${gitname}")
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK4/Adwaita приложение, которое позволит вам использовать Я.Музыку на Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/rirusha/${gitname}"
license=('GPL3')
depends=('glib2' 'gtk4' 'libgee' 'libadwaita' 'libsoup3' 'json-glib' 'sqlite3' 'libxml2' 'gstreamer' 'webkitgtk-6.0' 'gst-plugins-good' ) 
optdepends=( )
makedepends=('meson' 'ninja' 'cmake' 'blueprint-compiler' 'git' 'vala' 'gcc13' 'appstream-glib' 'python-packaging')
provides=("$gitname")
conflicts=("$gitname")
source=("git+${url}.git")
md5sums=('SKIP')

build() {
    cd "${gitname}/"
    export CC=gcc-13
    export CXX=g++-13
    git checkout tags/ver-"$pkgver"
    meson . builddir --prefix=/usr
    ninja -C builddir
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C builddir install
}

