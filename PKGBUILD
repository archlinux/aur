# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=2.0.28
pkgrel=1
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL3')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
makedepends=('git')
_tag=c27d1fb3ec3fea5464592d7bb014e9337b8a3021 # git rev-parse v${pkgver}
source=("git+https://github.com/haiwen/$_reponame.git#tag=$_tag")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_reponame"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package () {
  install -Dm 755 \
	  "${srcdir}/$_reponame/src/seadrive" \
	  "${pkgdir}/usr/bin/seadrive"
}
