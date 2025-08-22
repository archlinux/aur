# Maintainer: Justus Piater <Justus-dev at Piater dot name>
# Contributor: c0gnitivefl0w
# Contributor: eldios

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=3.0.16
pkgrel=1
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL-3.0-only')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl' 'argon2'
	 'glib2' 'zlib' 'util-linux-libs' 'jansson' 'glibc' 'libwebsockets')
makedepends=('git')
_tag=5cad3a92b56d8aa99b7901437467f29e0bbd1857 # git rev-parse v${pkgver}
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
