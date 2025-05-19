#Maintainer:    mumi jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

#Thanks Klaus Alexander Seistrup :)
#this PKGBUILD of Keypunch
#github Repo: https://github.com/bragefuglseth/keypunch/

pkgname="keypunch-git"
_appname="keypunch"
pkgver=6.3
pkgrel=2
pkgdesc='Practice your typing skills'
url='https://github.com/bragefuglseth/keypunch'
_app_website='https://apps.gnome.org/Keypunch'
arch=('aarch64' 'x86_64')
license=('GPL-3.0-or-later')
source=("git+$url.git")
sha512sums=('SKIP')
provides=('keypunch')
conflicts=('keypunch')
depends=('gtk4' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson' 'ninja' 'pkgconf')

#pkgver() {
#   cd "${srcdir}/${_appname}-${pkgver}"
#   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    arch-meson . build
    meson compile -C build
}

package() {
    cd "${srcdir}/${_appname}-${pkgver}"
    meson install -C build --destdir "$pkgdir"
}