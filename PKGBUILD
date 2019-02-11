# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: Andrey Solomatin
# Contributor: carstene1ns
# Contributor: Lukas Fleischer
# Contributor: Geoffrey Teale
# Contributor: Mark, Huo Mian
# Contributor: Biginoz
# Contributor: Mattias Andrée

pkgname=redshift-wayland-git
pkgver=1.11.r158.gab3a34c
pkgrel=1
pkgdesc="Adjusts the color temperature of your screen (with Wayland patches)"
arch=('i686' 'x86_64')
url='https://github.com/Lourens-Rich/redshift'
license=('GPL3')
provides=('redshift' 'redshift-sway-git')
conflicts=('redshift' 'redshift-sway-git')
depends=('geoclue2' 'libdrm' 'libxxf86vm' 'wayland' 'python' 'glib2' 'hicolor-icon-theme')
optdepends=('python-gobject: for redshift-gtk'
            'python-xdg: for redshift-gtk'
            'librsvg: for redshift-gtk'
            'weston: supporting wayland environment'
            'sway-git: supporting wayland environment'
            'orbital-git: supporting wayland environment')
makedepends=('intltool' 'python' 'git')
source=(redshift::"git+https://github.com/breznak/redshift.git#branch=Lourens-Rich-master")
md5sums=('SKIP')

pkgver() {
    cd redshift
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cd redshift

    ./bootstrap
    ./configure --prefix=/usr \
                --enable-drm \
                --enable-randr \
                --enable-vidmode \
                --enable-geoclue2 \
                --enable-wayland \
                --with-systemduserunitdir=/usr/lib/systemd/user
    make
}

package() {
    cd redshift
    make DESTDIR="$pkgdir" install
}
