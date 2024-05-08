# Maintainer: Darrion Whitfield <dwhitfield.ramfield.net>
pkgname=dns-doge
pkgver=2.7
pkgrel=1
pkgdesc="A dns dig utility with a colorful output and plenty of features"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Dj-Codeman/doge"
license=('EPL-2.0')
depends=('rust' 'pandoc')
source=('https://github.com/Dj-Codeman/doge/archive/refs/tags/v0.2.7.tar.gz')
sha256sums=('7049e2ccd6907f4f4222b8ea84160d65b57aadbbee9498da353a00c576bc647e')

prepare() {
    cd "${srcdir}/doge-0.2.7"
    make test-quick
}

build() {
    cd "${srcdir}/doge-0.2.7"
    make build-release
}

package() {
    cd "${srcdir}/doge-0.2.7"
    mkdir -pv "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/bash-completion/completions/"
    cp "target/release/doge" "${pkgdir}/usr/bin/doge"
	chmod +x "${pkgdir}/usr/bin/doge"
    # adding man pages
    pandoc --standalone -f markdown -t man man/doge.1.md > "${pkgdir}/usr/share/man/man1/doge.1"
}
