# Contributor: Gleb Liutsko <gleb@liutsko.ru>

pkgname=1c-connect
pkgver=5.0.5.707
pkgrel=1
pkgdesc="A solution for support services, consultations or service centers."
arch=('any')
url="https://1c-connect.com/ru/"
license=('custom')
depends=()
makedepends=()
checkdepends=()
source=('1c-connect.tar.gz::https://updates.1c-connect.com/desktop/distribs/1C-Connect-Linux-x64.tar.gz'
        '1c-connect.desktop'
        'connect.sh')
noextract=('1c-connect.tar.gz')
sha256sums=('d7695803c49b0869d418e3d1d24c66e32bc3a283ed9badb51522a492d87c6819'
            'SKIP' 'SKIP')

prepare() {
    cd "$srcdir"

    mkdir 1c-connect
    tar -xzf 1c-connect.tar.gz -C 1c-connect
}

package() {
   cd "$srcdir"
   
   mkdir -p "$pkgdir/usr/"{lib,share/icons}
   cp -r '1c-connect' "$pkgdir/usr/lib/1c-connect"
   ln -sf "$pkgdir/usr/lib/1c-connect/app/bin/ico-app.png" "$pkgdir/usr/share/icons/1c-connect.png"
   install -Dm 644 "1c-connect.desktop" -t "$pkgdir/usr/share/applications"
   install -Dm 755 'connect.sh' "$pkgdir/usr/bin/connect"
}
