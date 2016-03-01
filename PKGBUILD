# Contributor: Dragutin Cirkovic <dragonmen@gmail.com>
# Maintainer: Dragutin Cirkovic <dragonmen@gmail.com>
pkgname=srs
pkgver=2.0release
pkgrel=1
pkgdesc="High performance RTMP Server"
arch=('i686' 'x86_64')
url="https://github.com/dr4g0nsr/srs"
license=('GPL')
groups=('base-devel')
depends=()
makedepends=('zlib' 'libtool' 'unzip' 'gcc' 'net-tools' 'make' 'python' 'patch' 'autoconf')
optdepends=('logrotate')
conflicts=('srs-server-dev')
#install='srs-server.install'
options=('docs')
backup=('usr/conf/srs.conf')
source=("https://github.com/dr4g0nsr/srs/archive/$pkgver.zip")
md5sums=(SKIP)

prepare() {
        cd "$srcdir/$pkgname-$pkgver/trunk"
}

build() {
        cd "$srcdir/$pkgname-$pkgver/trunk"
        ./configure --prefix=/usr/local --without-http-callback --without-http-api --without-http-server
        make || return 1
}

package() {
        cd "$srcdir/$pkgname-$pkgver/trunk"
        make DESTDIR="$pkgdir" install || return 1
}

