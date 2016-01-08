# Maintainer: Azuki <support@azukiapp.com>
_pkgname='libnss-resolver'
pkgname=${_pkgname}-git
pkgver=0.3.0
pkgrel=1
pkgdesc="A Linux extension that adds support to the /etc/resolver/[suffix]."
arch=('x86_64')
url="https://github.com/azukiapp/libnss-resolver"
license=('Apache')
depends=('glibc')
makedepends=('make' 'fakeroot' 'git' 'clang' 'wget' 'scons')
provides=(${_pkgname%-git}=$pkgver)
conflicts=(${_pkgname%-git})
source=("git+https://github.com/azukiapp/libnss-resolver.git")
md5sums=('SKIP')
install=${pkgname}.install

pkgver() {
    cd "$_pkgname"
    git tag -l | sort -V | tail -1 | sed 's/^v//'
}

package() {
    cd "$_pkgname"
    scons prefix="$pkgdir/usr/lib" local-install
}
