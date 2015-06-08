# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andrew Kopplin <revrollic@gmail.com>

pkgname=surfraw-git
pkgver=2014.10.11.g48d3c11
pkgrel=1
pkgdesc="Shell Users' Revolutionary Front Rage Against the Web"
arch=('any')
url="http://surfraw.alioth.debian.org/"
license=('custom')
depends=('perl')
makedepends=('git')
install=$pkgname.install
provides=('surfraw')
conflicts=('surfraw')
backup=('etc/xdg/surfraw/conf' 'etc/xdg/surfraw/bookmarks')
_gitname="surfraw"
source=("$_gitname::git://git.debian.org/"$_gitname"/"$_gitname".git")
sha1sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
    cd "$_gitname"
    ./prebuild   
    ./configure --prefix=/usr --sysconfdir=/etc --disable-opensearch
    make
}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" install
    # license
    install -D -m644 COPYING "$pkgdir"/usr/share/licenses/"$_gitname"/COPYING 
}
