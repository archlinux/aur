# Maintainer: Bart De Vries <bart at mogwai dot be>
pkgname=twofing-git
pkgver=r33.3e1a2ed
pkgrel=1
pkgdesc="Touchscreen two-finger gestures daemon"
arch=('x86_64' 'armv6h' 'armv7h')
url="http://plippo.de/p/twofing"
license=('MIT')
groups=()
depends=(libxrandr libxtst)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=twofing-git.install
source=('twofing::git+https://github.com/Plippo/twofing.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -n '/Copyright/,/ SOFTWARE./p' twofingemu.c > LICENSE
    #patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
    install -D -m644  LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
