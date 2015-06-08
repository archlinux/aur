# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: ksj <podhorsky.ksj@gmail.com>

_gitname=geany-plugins
pkgname=geany-plugins-gtk3-git
pkgver=1.24.23.g0d11ade
pkgrel=1
pkgdesc='Plugins for Geany'
arch=('x86_64' 'i686')
url='http://plugins.geany.org/'
license=('GPL')
depends=('geany-gtk3-git' 'lua51' 'ctpl' 'gpgme' 'webkitgtk' 'gtkspell3')
makedepends=('git' 'automake' 'autoconf' 'intltool' 'libtool' 'python')
optdepends=('hspell: hebrew spell checker')
install='geany-plugins.install'
provides=('geany-plugins')
conflicts=('geany-plugins-svn' 'geany-plugins')
source=('git://github.com/geany/geany-plugins.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_gitname"
    ./autogen.sh --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
