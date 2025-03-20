#Maintainer:    Giteeajake <giteeajake@qq.com>

#this PKGBUILD of Keypunch
#https://github.com/bragefuglseth/keypunch/

pkgname="keypunch-git"
_appname="keypunch"
pkgver='v5.1_43e21e3'
pkgrel=1
pkgdesc='Practice your typing skills'
url='https://github.com/bragefuglseth/keypunch/'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')
depends=('gtk4' 'libadwaita>=1.7')
makedepends=('rust' 'meson' 'ninja' 'gettext' 'pkgconf' 'git' 'blueprint-compiler')

build() {
    cd ${srcdir}/${_appname}
    export RUSTUP_TOOLCHAIN=stable
    meson setup -Dprefix=/usr build
    meson compile -C build
}

package() {
    cd ${srcdir}/${_appname}
    meson install -C build --destdir "$pkgdir"
}
