# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

pkgname=xedgewarp
pkgver=1.1
pkgrel=1
pkgdesc='xedgewarp is a window manager agnostic tool for pointer warping between outputs'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/xedgewarp'
license=('MIT')
depends=('libxcb' 'xcb-util' 'libxi' 'libx11' 'libxrandr' 'libxfixes')
makedepends=('make' 'git' 'asciidoc')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/Airblader/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('61e82e01b00b521a838b3555736fa593fb26c3d6a856eb9654bc7aa17d19d396')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
