# Contributor: Javier Tiá <javier dot tia at gmail dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=fsql
pkgver=0.5.2
pkgrel=1
pkgdesc='Search through your filesystem with SQL-esque queries'
arch=('x86_64')
url='https://github.com/kashav/fsql'
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs' '!buildflags')
conflicts=('fsql-git')
replaces=('fsql-git')
provides=("fsql=${pkgver}")
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('d7b1474a262103713d74f0e33ddcebedcc35a559375f9ffc686cd02a0f49181605d9005a409f7a268f95f20a30875a9239aaf8592e5a6699d67a03229939636c')

build() {
	cd "${pkgname}-${pkgver}"
	export GOPATH="${srcdir}"
	go get -u -v ${url/https:\/\//}/...
  make
}

package() {
	cd "${pkgname}-${pkgver}"
  install -Dm755 fsql "$pkgdir/usr/bin/fsql"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
