# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="jellyfin-web-intro-skipper"
pkgver=10.8.9
pkgrel=1
pkgdesc="Modified jellyfin web client to use with the 'Intro Skipper' plugin"
arch=('any')
url="https://github.com/ConfusedPolarBear/jellyfin-web"
license=('GPL2')
provides=("${pkgname%-intro-skipper}=10.8.9")
conflicts=("${pkgname%-intro-skipper}")
makedepends=('npm')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname%-intro-skipper}"
    git reset --hard e8a79f654e4c55008cb3862f2a37dd626a3741ab
}

build() {
    cd "$srcdir/${pkgname%-intro-skipper}"
    npm ci --no-audit
}

package() {
    mkdir -p "$pkgdir"/usr/lib/jellyfin
    cp -r "$srcdir/jellyfin-web/dist" "$pkgdir/usr/lib/jellyfin/jellyfin-web"
}
