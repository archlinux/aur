# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=3.0.17
pkgrel=2
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL-3.0-only')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl' 'argon2'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('109e336cfa388a973bc0cd1a6f241067616f4f576175fd0170da5ef783c9c01ffd582e64d598e57177181fd4b10dfb025b8d03d8ea0041bf084087d91022b2ae')

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
