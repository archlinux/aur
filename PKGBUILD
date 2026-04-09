# Contributor: Gleb Liutsko <gleb@liutsko.ru>
# Contributor: Aleksey Ksenzov <aksenzov@gmail.com>

pkgname=1c-connect
pkgver=5.4.2
pkgrel=1
pkgdesc="A solution for support services, consultations or service centers."
arch=('any')
url="https://connect.ru"
license=('custom')
depends=(libxcrypt-compat)
makedepends=()
checkdepends=()

source=('1c-connect.tar.gz::https://updates.1c-connect.com/desktop/distribs/1C-Connect-Linux-x64.tar.gz'
        '1c-connect.desktop'
        'connect.sh')

noextract=('1c-connect.tar.gz')

sha256sums=('21dc6a44f75788b5dd03c3058de0d5aca7989e53a11ce4d10124458b4aa02943'
            '410d43e52f8f4a895268dcf612404df52b38b310eb39c64f40f3f32002d4c553'
            '48b91c95db0dbe98f7f99808b0633dc1cf44bfdd37349dfd374f37f9fada3c05')

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
