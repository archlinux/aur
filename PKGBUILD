# Maintainer: Howard Cheung <mail@h-cheung.cf>
# Contributor: Francisco Lopes <francisco@oblita.com>
pkgname=interception-caps2esc-4modifiers-git
_pname=interception-caps2esc
pkgver=0.1.3.r1.g262d6e2
pkgrel=1
pkgdesc='caps2esc: transforming the most useless key ever in the most useful one, patch to use Ctrl as 4 modifiers'
arch=('x86_64')
license=(MIT)
url='https://gitlab.com/h-cheung/caps2esc/'
depends=('interception-tools')
makedepends=('cmake' 'gcc')
conflicts=('caps2esc' 'interception-caps2esc')
provides=('caps2esc' 'interception-caps2esc')
source=("$pkgname::git+https://gitlab.com/h-cheung/caps2esc/")
md5sums=("SKIP")

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/$pkgname
    cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd $srcdir/$pkgname/build

    make DESTDIR="$pkgdir/" install
}
