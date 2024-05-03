# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
gitname=cassette
pkgname=cassette-dev
pkgver=0.2.0.20240504
pkgrel=1
pkgdesc="GTK4/Adwaita приложение, которое позволит вам использовать Я.Музыку на Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/rirusha/${gitname}"
license=('GPL3')
depends=('glib2' 'gtk4' 'libgee' 'libadwaita' 'libsoup3' 'json-glib' 'sqlite3' 'libxml2' 'gstreamer' 'webkitgtk-6.0' 'gst-plugins-good' ) 
optdepends=()
makedepends=('meson' 'ninja' 'cmake' 'blueprint-compiler' 'git' 'gcc' 'vala'  'appstream-glib' 'python-packaging')
provides=("$gitname")
conflicts=("$gitname")
source=("git+${url}.git")
md5sums=('SKIP')
options=('strip')

build() {
    cd "${gitname}/"
    meson . builddir --prefix=/usr
    meson configure -Dprofile=development builddir
    ninja -C builddir
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C builddir install
}

