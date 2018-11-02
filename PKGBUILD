# Maintainer: Ainola

pkgname=ctrl2esc-git
pkgver=v0.1.3.r3.g8688678
pkgrel=1
pkgdesc='Transforming the most useless key ever in the most useful one.'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/grimmware/ctrl2esc/'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
conflicts=('ctrl2esc')
source=("git+https://gitlab.com/grimmware/ctrl2esc.git")
sha256sums=('SKIP')
_basename="${pkgname%-git}"

pkgver() {
    cd "$_basename"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_basename"
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$_basename"
    make install
    install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
