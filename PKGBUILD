# Maintainer: Shadowigor <shadowigorr at gmail dot com>
pkgname="osync"
pkgver=v1.1.4.r11.02d732b
pkgrel=1
pkgdesc="A two way filesync script"
arch=("any")
url="https://github.com/deajan/osync"
license=('custom')
depends=('rsync')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/deajan/osync.git#branch=stable')
md5sums=('SKIP')

pkgver()
{
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare()
{
    cd "$pkgname"
    find . -type f -exec sed -i "s:/usr/local:/usr:g" {} ";"
    find . -type f -exec sed -i "s:/lib:/usr/lib:g" {} ";"
}

package()
{
    cd "$pkgname"
    echo n | FAKEROOT="$pkgdir" bash ./install.sh > /dev/null
}
