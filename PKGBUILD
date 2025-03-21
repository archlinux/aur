#Maintainer:    Giteeajake <giteeajake@qq.com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

#Thanks Klaus Alexander Seistrup :)
#this PKGBUILD of Keypunch
#github Repo: https://github.com/bragefuglseth/keypunch/

pkgname="keypunch-git"
_appname="keypunch"
pkgver=0
pkgrel=0
pkgdesc='Practice your typing skills'
url='https://github.com/bragefuglseth/keypunch/'
app_website='https://apps.gnome.org/Keypunch'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')
depends=('gtk4' 'libadwaita>=1.7')
makedepends=('rust' 'meson' 'ninja' 'gettext' 'pkgconf' 'git' 'blueprint-compiler')

pkgver() {
	cd "${srcdir}/${_appname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
