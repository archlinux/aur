pkgname='alsa-scarlett-gui-git'
_pkgname='alsa-scarlett-gui'
pkgver=0.5.1.6.gd731
pkgrel=2
pkgdesc="GUI for the ALSA controls presented by the Scarlett2 driver, Development version"
arch=('i686' 'x86_64')
url="https://github.com/geoffreybennett/alsa-scarlett-gui"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
depends=(
    'glibc'
    'glib2'
    'alsa-lib'
    'alsa-utils'
    'gtk4'
    'hicolor-icon-theme'
    'cairo'
    'pango'
    'openssl'
)
makedepends=('gcc' 'make' 'git' 'pkgconf' 'sed')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --abbrev=4 --always --tags | sed 's/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    make \
        -C src \
        PREFIX=/usr \
        VERSION="$pkgver"
}

package() {
    cd "$srcdir/$_pkgname"

    make \
        -C src \
        PREFIX="$pkgdir/usr" \
        VERSION="$pkgver" \
        install

    # documentation
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md ./docs/*.md
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/img" img/*
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname/demo" demo/*
}
