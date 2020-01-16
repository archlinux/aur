# Maintainer: Nahuel Gomez Castro <nahual_gomca@outlook.com.ar>

pkgname='gfeeds'
pkgver='0.12'
pkgrel='2'
pkgdesc='An RSS/Atom feed reader for GNOME'
changelog='CHANGELOG'
arch=('x86_64')
url='https://gabmus.gitlab.io/gnome-feeds'
license=('GPL3')
depends=('python-html5lib' 'webkit2gtk' 'python-gobject' 'python-pillow' 'python-feedparser'
         'python-listparser' 'python-readability-lxml' 'libhandy' 'python-dateutil')
makedepends=('meson' 'git')
provides=('gnome-feeds')
conflicts=('gnome-feeds' 'gnome-feeds-git' 'gfeeds-git')
source=("git+https://gitlab.gnome.org/World/gfeeds.git#tag=${pkgver}")
sha256sums=('SKIP')

pkgver () {
    cd ${pkgname}
    git describe --tags | sed 's/-/.r/; s/-/./'
}

build () {
    arch-meson ${pkgname} build
    ninja -C build
}

package () {
    DESTDIR="${pkgdir}" ninja -C build install
}
