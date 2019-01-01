# Maintainer: Ainola <ainola@archlinux.org>

pkgname=interception-ctrl2esc-git
pkgver=v0.1.3.r3.g8688678
pkgrel=2
pkgdesc='Transforming the most useless key ever in the most useful one.'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/grimmware/ctrl2esc/'
depends=('interception-tools')
makedepends=('cmake' 'gcc' 'git')
conflicts=('interception-ctrl2esc')
provides=('interception-ctrl2esc')
source=("git+https://gitlab.com/grimmware/ctrl2esc.git")
sha256sums=('SKIP')
_basename='ctrl2esc'

pkgver() {
    cd "$_basename"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_basename"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$_basename"
    make install DESTDIR="$pkgdir"
    install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
