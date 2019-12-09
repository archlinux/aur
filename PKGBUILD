# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# check https://kiwiirc.com/downloads/ for the latest version
pkgname=kiwiirc-bin
pkgver=19.04.24.1
pkgrel=1
pkgdesc="A hand-crafted web-based IRC client that you can enjoy"
arch=('x86_64')
url="https://kiwiirc.com/"
license=('APACHE')
conflicts=('kiwiirc')
provides=('kiwiirc')
source=("${url}downloads/kiwiirc_${pkgver}_linux_amd64.zip"
        "kiwiirc.service")
sha256sums=('bfa8deb775d992b8117add52ef062ff68824269d55d3e1a7815a771ed49a8923'
            'aaa2dea2d414dd5e2cf9a7929592a735a333f654e676a7450ea14bcbd32b63f3')

package() {
    cd "$srcdir/kiwiirc_linux_amd64"

    mkdir -p "$pkgdir/usr/bin"
    cp kiwiirc "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/etc/kiwiirc"
    cp config.conf.example "$pkgdir/etc/kiwiirc/"
    sed 's/www/\/usr\/share\/webapps\/kiwiirc/' -i "$pkgdir/etc/kiwiirc/config.conf.example"
    mkdir -p "$pkgdir/usr/share/webapps/"
    cp -r www "$pkgdir/usr/share/webapps/kiwiirc"

    cd "$srcdir"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp kiwiirc.service "$pkgdir/usr/lib/systemd/system/"
}
