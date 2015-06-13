# Maintainer: Paul Weingardt <paulweingardt@web.de>
# Contributor: TDY <tdy@gmx.com>
pkgname=git-cola-git
pkgver=v2.1.2.52.gd3eb9f3
pkgrel=1
pkgdesc="A powerful GUI for Git"
arch=('any')
url="http://git-cola.github.com/"
license=('GPL')
depends=('git' 'python-pyqt4>=4.4' 'icu')
makedepends=('asciidoc' 'docbook-xsl' 'rsync' 'xmlto' 'python-sphinx>=1.1.3')
optdepends=('python-pyinotify>=0.7.1: for inotify support'
'tk: to use the built-in ssh-askpass handler')
options=('!makeflags')
provides=('git-cola')
conflicts=('git-cola')

source=("$pkgname"::'git+https://github.com/davvid/git-cola.git')
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    # Use the tag of the last commit
    local ver="$(git describe --long)"
    printf "%s" "${ver//-/.}"
}

build() {
    cd "$pkgname"
    make all doc html
}

package() {
    cd "$pkgname"
    make prefix=/usr DESTDIR="$pkgdir" install{,-doc,-html}
}
