# Maintainer: ryoskzypu <ryoskzypu@proton.me>

pkgname='maskprocessor-git'
_pkgname=${pkgname%-git}
pkgver=0.73.r22.g9c33ab2
pkgrel=2
pkgdesc='High-Performance word generator with a per-position configurable charset'
arch=('i686' 'x86_64')
url="https://github.com/hashcat/$_pkgname"
license=('MIT')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver()
{
    cd "$_pkgname"

    git describe --long --tags | sed -r \
        -e 's/^v//' \
        -e 's/([^-]*-g)/r\1/' \
        -e 's/-/./g'
}

build()
{
    cd "$_pkgname/src"
    make
}

package()
{
    cd "$_pkgname"

    [[ $CARCH = 'x86_64' ]] && ARCHID=64 || ARCHID=32

    install -d "$pkgdir/usr/bin"
    install -Dm755 "src/mp$ARCHID.bin" "$pkgdir/usr/bin/mp"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
