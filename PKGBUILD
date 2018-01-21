# Maintainer: Nick Levesque <nick.levesque@gmail.com>
pkgname=fwup
pkgver=v0.19.0.r0.g0a5313f
pkgrel=1
pkgdesc="Configurable embedded Linux firmware update creator and runner"
arch=('any')
url="https://github.com/fhunleth/fwup"
license=('Apache v2.0')
groups=()
depends=('libsodium' 'libarchive' 'confuse')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/fhunleth/fwup#tag=v0.19.0')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

# Disabled until next release where test 145 is fixed
#check() {
#    cd "$srcdir/${pkgname%-git}"
#    make check
#}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install
}
