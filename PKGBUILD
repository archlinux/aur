# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-fixedpointnumbers
_pkgname=FixedPointNumbers
pkgver=0.5.3
pkgrel=2
pkgdesc='Fixed point types for Julia'
arch=(any)
url=https://github.com/JuliaMath/FixedPointNumbers.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)

_commit=b150d0d4335c17bb0e1a72f310ce21116fb9de95
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaMath/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('b24651e1f4e87cb1fae625cef50caabfff36dcf5b448a8c0d803eb6c06faa39d'
            'ccc35c4ecc6b3c409acb4d1078d27b571a60750e9dfb3c73a135ed8305e919e0')

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	JULIA_LOAD_PATH=src: julia test/runtests.jl
}
