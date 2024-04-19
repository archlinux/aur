# Maintainer: Darrion Whitfield <dwhitfield.ramfield.net>
pkgname=dns-doge
pkgver=2.6
pkgrel=1
pkgdesc="A dns dig utility with a colourful output and plenty of features"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Dj-Codeman/doge"
license=('EPL-2.0')
depends=('rust' 'pandoc')
source=('https://github.com/Dj-Codeman/doge/archive/refs/tags/v0.2.5.tar.gz')
sha256sums=('ccbf0740d079ca2293ee150fda9f11275838da8cd3ba6fd73917ba8901299113')

prepare() {
    cd "${srcdir}/doge-0.2.6"
    make test-quick
}

build() {
    cd "${srcdir}/doge-0.2.6"
    make build-release
}

package() {
    cd "${srcdir}/doge-0.2.6"
    mkdir -pv "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/bash-completion/completions/"
    cp "target/release/doge" "${pkgdir}/usr/bin/doge"
	chmod +x "${pkgdir}/usr/bin/doge"
    # adding man pages
    pandoc --standalone -f markdown -t man man/doge.1.md > "${pkgdir}/usr/share/man/man1/doge.1"
}
