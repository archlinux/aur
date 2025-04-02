# Maintainer: a821 at (nospam) mail de
# Contributor: Jelle van der Waa (arch maintainer)
# Contributor: Romain Porte <microjoe@mailoo.org>
# Contributor: Max Bruckner <max at maxbruckner dot de>
# Contributor: chefpeyo <pierre-olivier.huguet@asp64.com>
# Contributor: kuri <sysegv@gmail.com>

pkgname=cjson-git
pkgver=1.7.18.r11.g12c4bf1
pkgrel=2
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('x86_64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
depends=('glibc')
makedepends=('git' 'cmake')
conflicts=('cjson')
provides=('cjson')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd cJSON
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S cJSON \
       -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
       -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Wno-dev
    make -C build
}

check() {
    make -C build check
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -Dm644 "cJSON/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
