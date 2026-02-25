# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=zmx
pkgver=0.4.1
pkgrel=1
pkgdesc="Session persistence for terminal processes"
arch=('x86_64')
url="https://zmx.sh/"
license=('MIT')
makedepends=('zig')
conflicts=('zmx-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/neurosnap/${pkgname}/archive/refs/tags/v${pkgver}.zip")
sha512sums=('2529ab0e30488387ca17fe5a8b25911570a302ad6c75c2bd99164774e241844a8eff4b55a083b6dc13e9496d3c2581ec1304a781ebb703ffd659938b42449430')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR=build zig build \
        --prefix "/usr" \
        -Doptimize=ReleaseSafe
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -a build/* "$pkgdir/"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
