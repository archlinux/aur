# Maintainer: ryoskzypu <ryoskzypu@proton.me>

_prog='maskprocessor'
pkgname=$_prog-git
pkgver=0.73.r22.g9c33ab2
pkgrel=1
pkgdesc='High-Performance word generator with a per-position configurable charset'
arch=('i686' 'x86_64')
url="https://github.com/hashcat/$_prog"
license=('MIT')
makedepends=('git')
provides=("$_prog=$pkgver")
conflicts=("$_prog")
source=("git+$url")
sha256sums=('SKIP')

pkgver()
{
    cd "$_prog"

    git describe --long --tags | sed -r -e 's/^v//' \
                                        -e 's/([^-]*-g)/r\1/' \
                                        -e 's/-/./g'
}

build()
{
    cd "$_prog/src"
    make
}

package()
{
    cd "$_prog"

    [[ $CARCH = 'x86_64' ]] && ARCHID=64 || ARCHID=32

    install -d "$pkgdir/usr/bin"
    install -Dm755 "src/mp$ARCHID.bin" "$pkgdir/usr/bin/mp"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_prog/"
}
