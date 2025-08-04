# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.15
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go' 'gobject-introspection')
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8e1a28f85e2233f7c9872b5eaf1c7472b2c019716d1affc328192378a175a78')
b2sums=('ddbed13e93224fc57d947982da1c684384cb30fb4371289ed3a81a1c913ab75519c180511b3396108b1fea5d2d198eb348b008253c36290375dc55a66c193d2f')

build() {
    cd ${pkgname}-${pkgver}/cmd

    go build -x -o walker
}

package() {
    cd ${pkgname}-${pkgver}/cmd
    install -Dm 755 walker -t "${pkgdir}/usr/bin"

    cd ../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd internal/config
    install -Dm 644 config.default.toml -t "${pkgdir}/etc/xdg/walker"
    mv "${pkgdir}/etc/xdg/walker/config.default.toml" "${pkgdir}/etc/xdg/walker/config.toml"

    cd themes
    install -Dm 644 default.toml -t "${pkgdir}/etc/xdg/walker/themes"

    install -Dm 644 xdg_default.css -t "${pkgdir}/etc/xdg/walker/themes"
    mv "${pkgdir}/etc/xdg/walker/themes/xdg_default.css" "${pkgdir}/etc/xdg/walker/themes/default.css"
}
