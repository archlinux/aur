# Maintainer: Anselmo L. S. Melo <anselmo.melo@intel.com>
pkgname=soletta
pkgver=1_beta4
pkgrel=1
pkgdesc="Soletta project is a framework for making IoT devices."
arch=('i686' 'x86_64')
url="http://github.com/solettaproject/soletta"
license=('custom:BSD3')
depends=('python>=3.4' 'python-jsonschema')
makedepends=('git' 'python>=3.4' 'python-jsonschema')
checkdepends=()
optdepends=('gtk3' 'icu' 'curl' 'systemd')
conflicts=('soletta-git')
source=("https://github.com/solettaproject/soletta/archive/v$pkgver.tar.gz")
md5sums=('26ce6240441f8cefba538c59f645b5c5')

prepare() {
    cd "$pkgname-$pkgver"
    git submodule init && git submodule update
}

build() {
	cd "$pkgname-$pkgver"
    make alldefconfig
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
