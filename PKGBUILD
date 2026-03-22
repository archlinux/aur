# Maintainer: nihil5320 <https://github.com/nihil5320>
pkgname=proton-launcher
pkgver=0.1.1
pkgrel=1
pkgdesc='Shell-integrated launcher for running Windows applications via Proton on Linux'
arch=('x86_64')
url='https://github.com/nihil5320/proton-launcher'
license=('MIT')
depends=(
    'glibc'
    'libglvnd'
    'libx11'
    'libxcursor'
    'libxrandr'
    'libxinerama'
    'libxi'
    'libxxf86vm'
)
makedepends=('go')
optdepends=(
    'kdialog: KDE error dialogs'
    'zenity: GTK error dialogs'
    'nautilus: GNOME Files right-click integration'
    'mangohud: FPS overlay support'
    'gamemode: performance optimization'
    'gamescope: gaming compositor support'
    'umu-launcher: recommended Proton launcher backend (umu-run)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    make build
}

package() {
    cd "$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
