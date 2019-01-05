# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-datastructures
_pkgname=DataStructures
pkgver=0.14.0
pkgrel=2
pkgdesc='Julia implementation of Data structures'
arch=(any)
url=https://github.com/JuliaCollections/DataStructures.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath) # julia-primes) circular dependency for check()

_commit=e558358589cf4704b991bd4425dd9e5fa84c7d11
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaCollections/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('7934fd1fd78e9489cbafd73ee1a07381953035e675b3d5c6a7faa6cde1e4f087'
            '7f7668d5864d661e32aa75e5ef6e9de218e160ec849b67d7555e66a48b2aa4e9')

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp -r          $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/License.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Has circular dependency on julia-primes
#check() {
#	cd $_pkgname.jl-$pkgver
#	JULIA_LOAD_PATH=src: julia test/runtests.jl
#}
