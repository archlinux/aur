# Maintainer: Johannes Altmanninger <aclopte@gmail.com>

pkgname=git-autofixup
pkgdesc='A git subcommand to automatically create fixup commits for topic branches'
url='https://github.com/torbiak/git-autofixup'
license=('Artistic2.0')
pkgver=0.003001
pkgrel=1
depends=(perl git)
makedepends=(make patch)
optdepends=(
    'git-revise: efficiently apply fixup commits'
)
arch=(any)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/torbiak/git-autofixup/archive/refs/tags/v$pkgver.tar.gz"
    # https://github.com/torbiak/git-autofixup/pull/18
    blame-only-topic-commits.patch::https://github.com/torbiak/git-autofixup/pull/18/commits/181ea0f4cab30377cc1fd95f338b62bf1760ac08.patch
    # https://github.com/torbiak/git-autofixup/pull/25
    fast-staged-changes.patch::https://github.com/torbiak/git-autofixup/pull/25/commits/53a014ecf2a126df2887c1da578b43581bb25b32.patch
)
sha512sums=('a997976242ee0ee56f6e2f0e875f5b63b5b1418cdeb28ad36de11f42c1c8b1cad0e577f027e43e6750a4533b8a69979358ec2d8455f06b97fd21f558c9332158'
            'e8427edc063f6b0890679bf3975fe590fce7797ee44c393f889c006afd8fd8bd7d9afa822716d27a20912783775376e421ac686ad4af8f127710b8d3b11576d5'
            '75151da837938f5bc09ee3192ab7037ad880a2bca62e43d26201d3ce8fe088261ba9fcf6dd18c2c1c734903edfd17a72d3119ead6047c0044e88e077c286f0e0')

build() {
	cd "$pkgname-$pkgver"
	patch < ../blame-only-topic-commits.patch
	patch < ../fast-staged-changes.patch
	perl Makefile.PL
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
