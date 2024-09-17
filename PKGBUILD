# Maintainer: gesh <gesh@gesh.uni.cx>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=batsignal-git
_pkgname=${pkgname%-git}
pkgver=1.8.0.r0.g77e34ce
pkgrel=1
pkgdesc='Lightweight battery monitoring daemon'
arch=('i686' 'x86_64')
url="https://github.com/electrickite/$_pkgname"
license=('LicenseRef-ISC')
depends=('glibc' 'libnotify')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    make
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install-service
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
