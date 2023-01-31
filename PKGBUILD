# Maintainer: Joost Molenaar <jjm@j0057.nl>
pkgname=ssu
pkgver=0.3.2
pkgrel=4
epoch=
pkgdesc="Extremely simple su utility"
arch=(x86_64)
url="https://github.com/illiliti/ssu"
license=('GPL3')
source=("ssu-$pkgver::git+https://github.com/illiliti/ssu#tag=$pkgver"
        'ssu.conf'
        'completion.bash'
       )
md5sums=(SKIP
         SKIP
         SKIP
        )
depends=(glibc)
makedepends=(git)
options=(strip !debug)

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $srcdir/$pkgname-$pkgver/ssu

    install -o root -g root -m 755 -d $pkgdir/usr/share/man/man1
    install -o root -g root -m 755 -t $pkgdir/usr/share/man/man1 $srcdir/$pkgname-$pkgver/ssu.1

    install -o root -g root -m 755 -d $pkgdir/usr/lib/tmpfiles.d
    install -o root -g root -m 644 -t $pkgdir/usr/lib/tmpfiles.d $srcdir/ssu.conf

    install -o root -g root -m 755 -d $pkgdir/usr/share/bash-completion/completions
    install -o root -g root -m 644 -T $srcdir/completion.bash $pkgdir/usr/share/bash-completion/completions/ssu
}

# vim: set et ts=4 sw=4:
