# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-compat
_pkgname=Compat
pkgver=1.4.0
pkgrel=2
pkgdesc='Compat Package for Julia.'
arch=(any)
url=https://github.com/JuliaLang/Compat.jl
license=(MIT)
depends=(julia julia-loadpath)

_commit=5e7610914e6193b9723ecbc13901e27001c470b4
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaLang/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('64913d7dbde5b5a64608a1a52dc127dd58c9089dfa68fa4d3584a0a38ac50e5e'
            '635b69201accd41cbf62491638b8e880370a473dd6ecf438fcfc1a80211b3b6c')

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
