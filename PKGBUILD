pkgname=kdocker
pkgver=6.0
pkgrel=1
pkgdesc="An application to help you dock any application into the system tray"
arch=('i686' 'x86_64')
url="https://github.com/user-none/KDocker"
license=('GPL2')
depends=('qt6-base')
makedepends=('cmake' 'ninja' 'perl')
source=(https://github.com/user-none/KDocker/archive/${pkgver}.tar.gz)
sha256sums=('e319a0ed42417f824e5358fbdb528865d32de4c0558104bee8d51c8c8afaeafd')

build() {
    cd "$srcdir/KDocker-$pkgver"

    cmake -G Ninja .
    ninja
    
    pod2man -c "KDocker User Manual" "resources/man/kdocker.pod" > "resources/man/kdocker.1"
}

package() {
    cd "$srcdir/KDocker-$pkgver"

    install -Dm755 "kdocker"                                        "$pkgdir/usr/bin/kdocker"
    strip "$pkgdir/usr/bin/kdocker"
    install -Dm644 "appstream/com.kdocker.KDocker.metainfo.xml"     "$pkgdir/usr/share/appdata/kdocker.appdata.xml"
    install -Dm644 "resources/images/icons/kdocker.svg"             "$pkgdir/usr/share/pixmaps/com.kdocker.KDocker.svg"
    install -Dm644 "resources/desktop/com.kdocker.KDocker.desktop"  "$pkgdir/usr/share/applications/kdocker.desktop"
    install -Dm644 "resources/bash-completion/kdocker"              "$pkgdir/etc/bash_completion.d/kdocker"
    install -Dm644 "resources/man/kdocker.1"                        "$pkgdir/usr/share/man/man1/kdocker.1"
}
