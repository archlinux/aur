# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Benjamin Frank <ben+aur@pipsfrank.de>

pkgname=muttvcardsearch
pkgver=1.10
pkgrel=2
pkgdesc="A small mutt carddav search utility."
arch=('i686' 'x86_64')
url="https://github.com/BlackIkeEagle/muttvcardsearch"
license=('GPL')
depends=('curl' 'sqlite3')
makedepends=('cmake')
provides=(muttvcardsearch)
source=("$pkgname-$pkgver.tar.gz::https://github.com/BlackIkeEagle/muttvcardsearch/archive/v$pkgver.tar.gz")
sha256sums=('6014e4ccef00bd329cc9cfe8c8a94f9ecdb5167883bde4577816fcdfcd104f17')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}/" install
    install -Dm644 manual/muttvcardsearch.man "$pkgdir/usr/share/man/man8/muttvcardsearch.8"
}
