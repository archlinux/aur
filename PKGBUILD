# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

pkgname=file-roller-pantheon
pkgver=3.28.0+1ubuntu1+r4.4ab5e02aa
pkgrel=1
pkgdesc="Archive manipulator for GNOME (with elementary OS patches)"
url="https://gitlab.gnome.org/GNOME/file-roller/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(gtk3 dconf libarchive file json-glib libnotify zip unzip)
makedepends=(yelp-tools git libnautilus-extension meson appstream-glib)
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support')
groups=(pantheon)
provides=(file-roller="${pkgver}")
conflicts=(file-roller)
source=("git+https://github.com/elementary/os-patches.git#branch=file-roller-bionic-patched")
sha256sums=('SKIP')

pkgver() {
    cd "os-patches"

    printf "3.28.0+1ubuntu1+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "os-patches"
    [ -d build ] && rm -rf build
    arch-meson build
    ninja -C build
}

package() {
    cd "os-patches"
    DESTDIR="${pkgdir}" ninja -C build install
}
