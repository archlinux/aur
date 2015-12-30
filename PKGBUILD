# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Benjamin Frank <ben+aur@pipsfrank.de>

pkgname=muttvcardsearch
pkgver=1.10
pkgrel=3
pkgdesc="A small mutt carddav search utility."
arch=('i686' 'x86_64')
url="https://github.com/BlackIkeEagle/muttvcardsearch"
license=('GPL')
depends=('curl' 'sqlite3')
makedepends=('cmake')
provides=(muttvcardsearch)
source=("$pkgname-$pkgver.tar.gz::https://github.com/BlackIkeEagle/muttvcardsearch/archive/v$pkgver.tar.gz" "10.patch")
sha256sums=('6014e4ccef00bd329cc9cfe8c8a94f9ecdb5167883bde4577816fcdfcd104f17'
            '683528161e1b4f19ba75c5e367917969f2d5f995fc753659d8c59079a314d3cc')

build() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/10.patch"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}/" install
}
