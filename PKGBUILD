# Maintainer: Justus Piater <Justus-dev at Piater dot name>

_reponame=seadrive-fuse
pkgname=seadrive-daemon
pkgver=2.0.22
pkgrel=2
pkgdesc="SeaDrive daemon with FUSE interface"
arch=('x86_64')
url="https://github.com/haiwen/seadrive-fuse"
license=('GPL3')
depends=('libsearpc' 'sqlite' 'curl' 'fuse2' 'libevent' 'openssl')
makedepends=('git')
_tag=07a788a395e4669156bca294475692fb56b24947 # git rev-parse v${pkgver}
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
