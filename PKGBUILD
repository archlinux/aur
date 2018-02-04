# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andrew Kopplin <revrollic@gmail.com>

pkgname=surfraw-git
_gitname="Surfraw"
pkgver=2018.02.03.g9b1b780
pkgrel=2
pkgdesc="Shell Users' Revolutionary Front Rage Against the Web"
arch=('any')
url="https://gitlab.com/surfraw/Surfraw"
license=('custom')
depends=('perl')
makedepends=('git')
install=$pkgname.install
provides=('surfraw')
conflicts=('surfraw')
backup=('etc/xdg/surfraw/conf' 'etc/xdg/surfraw/bookmarks')
source=(git+https://gitlab.com/surfraw/Surfraw.git)
sha1sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
    cd "${_gitname}"
    ./prebuild   
    ./configure --prefix=/usr --sysconfdir=/etc --disable-opensearch
    make
}

package() {
    cd "${_gitname}"
    make DESTDIR="$pkgdir" install
    # license
    install -D -m644 COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING 
}

# vim:set ts=2 sw=2 et:
