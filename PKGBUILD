# Maintainer: Alex Palaistras <alex+archlinux@deuill.org>

_pkgname=elektroid
pkgname=$_pkgname-git
pkgver=2.0.beta.r101.ge94eb07
pkgrel=1
pkgdesc="GNU/Linux transfer application for Elektron devices"
arch=('i686' 'x86_64')
url="https://github.com/dagargo/elektroid"
license=('GPL-3.0')
depends=('gtk3' 'alsa-lib' 'libpulse' 'libsndfile' 'libsamplerate' 'zlib' 'json-glib' 'libzip')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/dagargo/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    autoreconf --install
}

build() {
    cd "$_pkgname"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir" install
}
