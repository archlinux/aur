# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=fedistar-bin
_name="${pkgname%-bin}"

pkgver=1.13.0
pkgrel=1
pkgdesc="Multi-column Fediverse client for desktop"
arch=('x86_64')
url="https://github.com/h3poteto/fedistar"
license=('GPL-3.0')
depends=('webkit2gtk-4.1' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips' 'libxml2-legacy')
makedepends=('curl' 'wget' 'tar')
optdepends=('xorg-xwayland: Required for Wayland environments')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/h3poteto/fedistar/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
md5sums=('bc380db1c388a86833e000521f8309f4')

prepare() {
    ar x "${_name}_${pkgver}_amd64.deb"
    tar xvf data.tar.gz
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share"
    cp -R usr/share/* "$pkgdir/usr/share/"
    install -Dm755 "usr/bin/${_name}" "$pkgdir/usr/bin/${_name}"
}
