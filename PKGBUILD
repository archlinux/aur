# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# Contributor: Marvin Gülker <quintus at quintilianus point eu>
# Contributor: Pierre Chapuis <catwell at archlinux dot us>

pkgname='mlmmj'
pkgver=1.3.0
pkgrel=2
pkgdesc='Simple and slim mailing list manager (MLM) inspired by ezmlm'
depends=('sh')
arch=('i686' 'x86_64')
url='http://mlmmj.org/'
license=('MIT')
source=("http://mlmmj.org/releases/mlmmj-$pkgver.tar.gz"
	"$pkgname-$pkgver.diff")
sha256sums=('7609d0dd804f0c084c2e483eb58c60012b698bc76464537852a1ee1ff9c6f0e9'
            '18dd3c663c0c5cc4a713b70b7eb03c2a2b9d6af316e1e080febda1ef61be399c')
b2sums=('6b56ead8fb5840964835b139be7566a14df53266a7d83323176f73430c76702f0dc50f5b255e5881887ad8618abe3ace6cd710128821654709b6135b53adbfe4'
        'c0beb31414df706e3ce2fc62f8d23f893c8ce199adc2a81a48d3e3df6ddcbd131588d0ad12a4cfcd1d0e3db799ed95101a40d9b88d7ee758413310e2dfe205ab')

prepare() {
    cd "$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/$pkgname-$pkgver.diff"
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    install -m 0755 -d        "$pkgdir/usr/share/licenses/mlmmj"
    install -m 0644 AUTHORS   "$pkgdir/usr/share/licenses/mlmmj/"
    install -m 0644 COPYING   "$pkgdir/usr/share/licenses/mlmmj/"
    install -m 0644 LICENSE   "$pkgdir/usr/share/licenses/mlmmj/"

    install -m 0755 -d        "$pkgdir/usr/share/doc/mlmmj"
    install -m 0644 ChangeLog "$pkgdir/usr/share/doc/mlmmj/"
    install -m 0644 FAQ       "$pkgdir/usr/share/doc/mlmmj/"
    install -m 0644 README*   "$pkgdir/usr/share/doc/mlmmj/"
    install -m 0644 TUNABLES  "$pkgdir/usr/share/doc/mlmmj/"
    install -m 0644 UPGRADE   "$pkgdir/usr/share/doc/mlmmj/"
}

# eof
