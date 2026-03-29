# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=3.0.21
pkgrel=1
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL-3.0-only')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl' 'argon2'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('953046b4af6694bfc460b7a44df754f000b1deacfa5ec6f240bf51b159e80460fb572c07549f62a65afd75535bfdc155c392029856096fd9ac302ed42a4bad04')

build() {
  cd "$srcdir/$_reponame-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package () {
  install -Dm 755 \
	  "${srcdir}/$_reponame-$pkgver/src/seadrive" \
	  "${pkgdir}/usr/bin/seadrive"
}
