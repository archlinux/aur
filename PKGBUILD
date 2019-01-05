# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-orderedcollections
_pkgname=OrderedCollections
pkgver=1.0.2
pkgrel=2
pkgdesc='Julia implementation of associative containers that preserve insertion order '
arch=(any)
url="https://github.com/JuliaCollections/OrderedCollections.jl"
license=(MIT)
depends=(julia julia-loadpath)

_commit=18f9a555382c1ee43861bbc4b1e2df7b3ae0829b
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('33d4e568f7cbffe9187d7548e86487f375ec0be07fa0da3743a2e008a8453707'
            '70bf9e181599853f1903f8c8f2ca5f26d9aab31d945df87796d6a2f3c8019060')

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp -r         $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644 $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/License.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src: julia test/runtests.jl
}
