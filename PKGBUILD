# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-binaryprovider
_pkgname=BinaryProvider
pkgver=0.5.3
pkgrel=1
pkgdesc='A reliable binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPackaging/BinaryProvider.jl
license=(MIT)
depends=(julia)
checkdepends=(curl git)

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('ef242e8c9250dbb8752eef4ecd504776e70c50b6d62ffea1a6d16150d6d0e282')

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 $pkgdir/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test} $pkgdir/usr/share/julia/environments/v1.0/$_pkgname/
}

check() {
	cd $_pkgname.jl-$pkgver/test
	JULIA_LOAD_PATH=$srcdir/$_pkgname.jl-$pkgver/src:$JULIA_LOAD_PATH julia runtests.jl
}
