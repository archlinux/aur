# Maintainer: Kostoski Stefan <kostoski.stefan90@gmail.com>

_appname=hoverclock
pkgname=hoverclock-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A very lightweight and customizable floating clock for Linux"
arch=('x86_64')
url="https://github.com/kostoskistefan/hoverclock"
license=('MIT')
depends=('libxcb' 'fontconfig' 'freetype2')
source=("git+https://github.com/kostoskistefan/hoverclock.git")
conflicts=('hoverclock-appimage' 'hoverclock-qt')
makedepends=('meson')
sha256sums=('SKIP')
options=(!debug)

prepare() 
{
    meson subprojects download --sourcedir=$_appname
}

build() 
{
    arch-meson $_appname build
    meson compile -C build
}

package() 
{
    meson install -C build --skip-subprojects --destdir "$pkgdir"
}
