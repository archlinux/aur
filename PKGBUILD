# Maintainer: Bitals <me at bitals dot xyz>
pkgname=mac-telnet
pkgver=0.4.4
pkgrel=2
pkgdesc="Console tools for connecting to, and serving, devices using MikroTik RouterOS MAC-Telnet protocol."
arch=('x86_64')
url="https://github.com/haakonnessjoen/MAC-Telnet"
license=('GPL2')
depends=('glibc')
makedepends=('git' 'automake' 'autoconf' 'clang' 'make' 'gettext')
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/haakonnessjoen/MAC-Telnet/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('344eb7fc4008ffaffda7359ba6d266c1a416eaea8b017859f652962c95135a5466d1f94e9afd8ad91f8045d2134067f2b2395e065d619dc116371ea13dbeb575')

build() {
    cd "$srcdir"/MAC-Telnet-"$pkgver"
    ./autogen.sh
    ./configure
    make all
}

package() {
    cd "$srcdir"/MAC-Telnet-"$pkgver"
    make 'prefix=/usr' 'sbindir=${exec_prefix}/bin' 'sysconfdir=/etc/'"$pkgname" DESTDIR="$pkgdir" install
}