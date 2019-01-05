# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-conda
_pkgname=Conda
pkgver=1.1.1
pkgrel=2
pkgdesc='Use conda as a cross-platform binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPy/Conda.jl
license=(MIT)
depends=(julia julia-compat julia-loadpath)
checkdepends=(julia-versionparsing)

_commit=9934475171b9a1bafb950868280b5aa2138687ed
source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaPy/$_pkgname.jl/archive/v$pkgver.tar.gz
        $pkgname-Package.toml::https://raw.githubusercontent.com/JuliaRegistries/General/$_commit/${_pkgname:0:1}/$_pkgname/Package.toml)
sha256sums=('e506dc7be838432d5f92407db3bdfcb5f1716ff0d1e52015e93956f1eb206994'
            '16404fdeb5c5df9d923ffbdc6f6d146561242cbf1255dc67ab668625480d4be2')

build() {
	cd $_pkgname.jl-$pkgver/deps
	CONDA_JL_HOME=/usr julia build.jl
}

package() {
	install -d "$pkgdir"/usr/share/julia/vendor

	cp      -r     $_pkgname.jl-$pkgver  "$pkgdir"/usr/share/julia/vendor/$_pkgname
	install -m644  $pkgname-Package.toml "$pkgdir"/usr/share/julia/vendor/$_pkgname/Project.toml

	install -Dm644 $_pkgname.jl-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Will download the full MiniConda installer, so disable
#check() {
#	cd $_pkgname.jl-$pkgver
#	ROOTENV=/usr JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
