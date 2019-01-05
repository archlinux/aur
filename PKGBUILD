# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-versionparsing
_pkgname=VersionParsing
pkgver=1.1.3
pkgrel=2
pkgdesc="Flexible parsing of version-number strings into Julia's built-in VersionNumber type"
arch=(any)
url=https://github.com/stevengj/VersionParsing.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)

_commit=334790bf66964522555084d375eef20d1390fb06
source=($pkgname-$pkgver.tar.gz::https://github.com/stevengj/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('b681185b05ced15f0eb9be26f943898ac43cfcf561201a2f6e35e321c8e441e6'
            'c8de56d3c846a487b5909e6666d3665ec7a7676571b108da71784dbeec385e92')

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

check() {
	cd $_pkgname.jl-$pkgver
	HOME="$srcdir" JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
}
