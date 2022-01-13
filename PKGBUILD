# Maintainer: Bruno Dupuis <lisael@lisael.org>
pkgname=birdie-alarm-mobile-git
pkgver=r61.14831c3
pkgrel=1
pkgdesc="Wakeup Alarm App for a Linux Phone"
arch=('x86_64' 'aarch64')
url="https://github.com/Dejvino/birdie"
license=('GPL')
depends=(
    'desktop-file-utils'
    'glib2'
    'gobject-introspection-runtime'
    'gst-plugins-base'
    'hicolor-icon-theme'
    'python-gobject'
    'python-mpris_server'
    'python-psutil'
)
makedepends=(
    'git'
)
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'wake-mobile-git')
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/Dejvino/birdie.git')
noextract=()

md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
    cd "$srcdir/birdie"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/birdie"
    sed -i 's/\/lib\/systemd/\/usr\/lib\/systemd/' Makefile
}

build() {
    cd "$srcdir/birdie"
    make
}

package() {
    cd "$srcdir/birdie"
    make DESTDIR="$pkgdir/" install
}
