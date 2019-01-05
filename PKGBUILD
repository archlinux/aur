# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-offsetarrays
_pkgname=OffsetArrays
pkgver=0.9.1
pkgrel=2
pkgdesc='Provides Julia users with arrays that have arbitrary indices'
arch=(any)
url=https://github.com/JuliaArrays/OffsetArrays.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)

_commit=0d0fb6ad47b2b7c0dd23a0cbf000bcdb4be2b616
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaArrays/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('f9a60f31eacb447f59e0a351f7afe3a96691e5b354c6bde0ba321dc2862b5eb8'
            '1b21bc2bfd68eacbdeaf49ffd8f4f8da091ea82f767a070ff921cdc3d446601f')

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src: julia test/runtests.jl
}
