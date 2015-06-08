# Maintainer: replabrobin 
# services for arch-runit
# 
# copyright see
# http://creativecommons.org/publicdomain/zero/1.0/

pkgname=arch-runit-services
pkgver=20150530_1544
_runit_ver=2.1.2
pkgrel=1
pkgdesc='Arch native runit package'
url='https://bitbucket/replabrobin/arch-unit-services'
license=('Creative Commons')
arch=('any')
source=("$pkgname::hg+https://bitbucket.org/replabrobin/arch-runit-services")
sha256sums=('SKIP')
depends=()
makedepends=('mercurial')
optdepends=()
provides=('arch-runit-services')
conflicts=(
		runit-scripts
		runit-services
		runit-services-git
		void-runit
		)

build(){
	true
	}

pkgver(){
	cd "$pkgname"
	hg log --limit=1 --template='{date|isodate}' | sed -e's/ /_/;s/ .*$//;s/-//g;s/://'
	}

package() {
	local d
	cd "$srcdir/$pkgname"
	install -dm0755 "$pkgdir/etc"
	install -dm0755 "$pkgdir/etc/sv"
	for d in *; do
		[ -f "$d/run" ] && cp -pr $d $pkgdir/etc/sv/$x
	done
	}
