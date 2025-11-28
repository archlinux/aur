# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=3.0.18
pkgrel=1
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL-3.0-only')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl' 'argon2'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('16b5c8c37cc2aca3c184b721ea557bffb8c58b4bc61f90f909cd625a6ddc62d084bc7842a1c698a2f90ab3a22e1fcd22e90ea0ad0f34af8e1493862930636c3d')

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
