# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Kerrick Staley <mail@kerrickstaley.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=pitivi-git
pkgver=2021.01.0.r68.gf0a99577
pkgrel=1
pkgdesc='Editor for audio/video projects using the GStreamer framework (git version)'
arch=('x86_64')
url='http://www.pitivi.org/'
license=('LGPL')
depends=('gsound' 'gst-editing-services' 'gst-plugin-gtk' 'gst-plugins-bad' 'gst-plugins-good' 'gst-python'
         'gtk3' 'libnotify' 'libpeas' 'python-cairo' 'python-gobject' 'python-matplotlib' 'python-numpy')
makedepends=('git' 'appstream-glib' 'intltool' 'itstool' 'meson')
optdepends=('frei0r-plugins: additional video effects, clip transformation feature'
            'gst-libav: additional multimedia codecs'
            'gst-plugins-ugly: additional multimedia codecs')
provides=('pitivi')
conflicts=('pitivi')
source=('git+https://gitlab.gnome.org/GNOME/pitivi.git')
sha256sums=('SKIP')

pkgver() {
    git -C pitivi describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    arch-meson build pitivi
    ninja -v -C build
}

check() {
    ninja -v -C build test
}

package() {
    DESTDIR="$pkgdir" ninja -v -C build install
}
