# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=3.0.12
pkgrel=1
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL3')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
makedepends=('git')
_tag=6b4b3bb5bb076c0e656e30a400300f18b29a2559 # git rev-parse v${pkgver}
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
