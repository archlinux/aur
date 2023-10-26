# Maintainer: Mads Mogensen <mads256h at gmail dot com>

pkgname="verifytapn-git"
pkgver='a12a596'
pkgrel='1'
pkgdesc='VerifyTAPN is a stand-alone verification engine for timed-arc Petri nets, developed for the verification tool TAPAAL.'
arch=('x86_64')
url="https://www.tapaal.net/"
license=('GPL2')
depends=()
makedepends=('cmake' 'git')
source=(
  "$pkgname::git+https://github.com/TAPAAL/verifytapn.git"
)
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname/"
	git rev-parse --short HEAD
}

build() {
	cd "$srcdir/$pkgname/"
	cmake -S '.' -B 'build/' \
	  -DCMAKE_BUILD_TYPE=Prebuild \
		-DCMAKE_INSTALL_PREFIX='/usr'
	make -C 'build/'

	cmake -S '.' -B 'build/' \
    -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX='/usr'
	make -C 'build/'
}

package() {
  install -Dm 755 "$srcdir/$pkgname/build/verifytapn/bin/verifytapn-linux64" "$pkgdir/usr/bin/verifytapn"
}
