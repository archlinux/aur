# Maintainer HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cdecrypt-git
pkgver=4.8.r1.g0ca58c6
pkgrel=1
pkgdesc="A utility that decrypts Wii U NUS content files."
arch=('x86_64')
url="https://github.com/VitaSmith/cdecrypt"
license=('GPL-3.0-or-later')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
depends=('glibc')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname::-4}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

prepare() {
  cd "$srcdir/${pkgname::-4}"
  sed -i 's/-O2/-O2 ${EXTRA_CFLAGS}/;s/LDFLAGS=-s/LDFLAGS=-s ${EXTRA_LDFLAGS}/' Makefile
}

build() {
    cd "$srcdir/${pkgname::-4}"
    EXTRA_CFLAGS="${CFLAGS}" \
    EXTRA_LDFLAGS="${LDFLAGS}" \
    make
}

package() {
    cd "${srcdir}/${pkgname::-4}"
    install -Dm755 ${pkgname::-4} "$pkgdir/usr/bin/${pkgname::-4}"
}
