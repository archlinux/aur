# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=3.0.22
pkgrel=1
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL-3.0-only')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl' 'argon2'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('422f4942b5773aa6a16b177df890bf390c47a505cc1cd16059f9778379d0b2eb4168fd43f2f783dc727b20630e2b903d4b77eb5c8c9d2df29f45bbfd00f40013')

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
