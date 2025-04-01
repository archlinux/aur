#Maintainer:    Giteeajake <giteeajake@qq.com>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

#Thanks Klaus Alexander Seistrup :)
#this PKGBUILD of Keypunch
#github Repo: https://github.com/bragefuglseth/keypunch/

pkgname="keypunch-git"
_appname="keypunch"
pkgver=5.1.r63.ge4e1d1b
pkgrel=1
pkgdesc='Practice your typing skills'
url='https://kkgithub.com/bragefuglseth/keypunch'
_app_website='https://apps.gnome.org/Keypunch'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
source=("git+$url.git")
sha256sums=('SKIP')
provides=('keypunch')
conflicts=('keypunch')
depends=('gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'gettext' 'git' 'meson' 'ninja' 'pkgconf' 'rust')

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
