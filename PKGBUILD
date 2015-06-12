# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=geany-plugins
pkgname=$_gitname-gtk3-git
pkgver=1.24.r386.g3aac929
pkgrel=1
pkgdesc='Plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=('geany-gtk3-git' 'lua51' 'ctpl' 'gpgme' 'webkitgtk' 'gtkspell3')
makedepends=('git' 'intltool' 'python')
optdepends=('hspell: hebrew spell checker')
install="$_gitname.install"
provides=("$_gitname")
conflicts=("$_gitname-svn" "$_gitname")
source=($_gitname::git://github.com/geany/$_gitname.git)
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd $_gitname
    ./autogen.sh --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd $_gitname
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
