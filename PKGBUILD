# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=sshping
pkgver=0.1.4
pkgrel=1
pkgdesc="ssh-based ping: measure character-echo latency and bandwidth for an interactive ssh session"
url="https://github.com/spook/sshping"
arch=('x86_64')
license=('MIT')
depends=('libssh')
makedepends=('perl')
source=("https://github.com/spook/sshping/archive/v${pkgver}.tar.gz")
sha256sums=('589623e3fbe88dc1d423829e821f9d57f09aef0d9a2f04b7740b50909217863a')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make bin/sshping
  make doc/sshping.8
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${pkgdir}/usr/bin"
  cp bin/sshping "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/usr/share/man/man8"
  gzip -9cn doc/sshping.8 > "${pkgdir}/usr/share/man/man8/sshping.8.gz"

  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
