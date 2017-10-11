# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=go-photobackup
pkgver=0.1.0
pkgrel=1
pkgdesc="The simplest way to keep your photos where they belong, at YOUR home!"
arch=('x86_64' 'i686')
url="http://photobackup.github.io/"
license=('BSD')
depends=('')
makedepends=('go' 'git')
provides=('photobackup')
replaces=('nodejs-photobackup' 'perl-photobackup' 'rust-photobackup' 'php-photobackup' 'asp-photobackup')
options=('!strip' '!emptydirs')
source=("https://github.com/PhotoBackup/server-go/archive/v${pkgver}.tar.gz")
sha256sums=('7c5eb3210884428faee33cb3cdb3b3dabf7c9d3251c2dcfb66babb7710a0af0a')

build() {
  cd server-go-${pkgver}
  GOPATH=`pwd` go get -d -v
}

check() {
  cd server-go-${pkgver}
  GOPATH=`pwd` go build
}

package() {
  cd "${srcdir}/server-go-${pkgver}"

  install -Dm644 config.example "${pkgdir}/usr/share/doc/go-photobackup/config.example"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/go-photobackup/LICENSE.txt"
  install -Dm755 server-go-${pkgver} "${pkgdir}/usr/bin/photobackup"
}

# vim:set ts=2 sw=2 et:
