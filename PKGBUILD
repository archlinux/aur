# Maintainer: Yanning Chen <self at lightquantum at me>
pkgname=agda-bin-git
pkgver=2.6.2.98d4eb0
pkgrel=1
pkgdesc="A dependently typed functional programming language and proof assistant: development version"
arch=('x86_64')
url="http://wiki.portal.chalmers.se/agda/"
license=('custom')
makedepends=('tar' 'sed')
provides=("agda")
conflicts=("agda")
source=("https://github.com/agda/agda/releases/download/nightly/Agda-nightly-linux.tar.xz" "https://github.com/agda/agda/blob/nightly/LICENSE")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/Agda-nightly"
    ./bin/agda -V|sed -rn "s/.*version (.*)-(.*)/\1.\2/p"
}

package() {
    cd "$srcdir"
    pushd "Agda-nightly"
    pushd bin
    find ./ -type f -exec install -Dm755 {} "${pkgdir}/usr/bin/{}" \;
    popd
    pushd data
    find ./ -type f -exec install -Dm600 {} "${pkgdir}/usr/share/agda/{}" \;
    popd
    popd
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/agda/LICENSE"
}
