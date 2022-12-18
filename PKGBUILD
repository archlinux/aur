# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=fedistar-bin
_name="${pkgname%-bin}"

pkgver=0.3.4
pkgrel=2
pkgdesc="Multi-column Mastodon and Pleroma client for desktop"
arch=('x86_64')
url="https://github.com/h3poteto/fedistar"
license=('AGPL-3.0')
depends=('webkit2gtk' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('curl' 'wget' 'tar')
provides=("$_name")
conflicts=("$_name")
source=("https://github.com/h3poteto/fedistar/releases/download/v${pkgver}/${_name}_${pkgver}_amd64.deb")
md5sums=('46ce73c71d3bb7d748fc877cdbc2ef08')

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
