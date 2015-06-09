# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: philomath <philomath868 AT gmail DOT com>
pkgname=dateutils
pkgver=0.3.2
pkgrel=1
pkgdesc="nifty utilities and library for fast date-time calculations and conversion (strptime, dadd, dconv, ddiff, dgrep, dround, dseq, dtest)"
arch=('i686' 'x86_64')
url="http://hroptatyr.github.com/dateutils/"
license=('BSD')
depends=('glibc')
changelog=Changelog
install=dateutils.install
source=("https://bitbucket.org/hroptatyr/$pkgname/downloads/$pkgname-${pkgver}.tar.xz")
md5sums=('206de43a9fea4b991fb53043d6fbf678')

prepare () {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
}

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

check () {

    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    sed -n '/* Copyright/,/ DAMAGE.$/p' src/dadd.c > "$pkgdir"/usr/share/licenses/dateutils/LICENSE

    # readme
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"
}
