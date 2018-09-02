# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot_org>

pkgname=julia-conda
_pkgname=Conda
pkgver=1.0.1
pkgrel=1
pkgdesc='Use conda as a cross-platform binary provider for Julia'
arch=(any)
url=https://github.com/JuliaPy/Conda.jl
license=(MIT)
depends=(julia julia-compat)
checkdepends=(julia-versionparsing)

source=($pkgname-$pkgver.tar.gz::https://github.com/JuliaPy/$_pkgname.jl/archive/v$pkgver.tar.gz)
sha256sums=('66da41669da81d0978a76e8ddb9490911f758153b1b6a915aada5fc73fdc8ee0')

build() {
	cd $_pkgname.jl-$pkgver/deps
	CONDA_JL_HOME=/usr julia build.jl
}

package() {
	cd $_pkgname.jl-$pkgver
	install -dm755 "$pkgdir"/usr/share/julia/environments/v1.0/$_pkgname
	cp -r {src,test,deps} "$pkgdir"/usr/share/julia/environments/v1.0/$_pkgname/
}

# Will download the full MiniConda installer, so disable
#check() {
#	cd $_pkgname.jl-$pkgver
#	ROOTENV=/usr JULIA_LOAD_PATH=src:$JULIA_LOAD_PATH julia test/runtests.jl
#}
