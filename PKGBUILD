# Maintainer: Hugo Hörnquist <hugo@lysator.liu.se>
# Contributor: Sanpi <sanpi+aur@homecomputing.fr>
_pkgname=effitask
pkgname=effitask-git
pkgver=r231.e243c4d
pkgrel=1
pkgdesc='Graphical task manager, based on the todo.txt format'
url="https://github.com/sanpii/$_pkgname"
arch=('x86_64')
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust' 'git')
source=("git+$url")
conflicts=('effitask')
provides=('effitask')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$srcdir/$_pkgname"

    cargo build --release
}

package()
{
    cd "$srcdir/$_pkgname"

    make install PREFIX="$pkgdir/usr"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
