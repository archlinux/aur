# Contributor: Bug <bug2000@gmail.com>
# Maintainer: Bug <bug2000@gmail.com>
pkgname=dexed-ide
_pkgname=dexed
pkgver=3.9.12
pkgrel=1
pkgdesc="IDE for the D programming language, its compilers, tools and libraries"
arch=(x86_64)
url="https://gitlab.com/basile.b/dexed"
license=('Boost')
depends=(dcd dscanner vte-legacy)
makedepends=(lazarus git)
conflicts=(dexed-ide-bin)
checkdepends=()
#source=("https://gitlab.com/basile.b/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
source=("git+https://gitlab.com/basile.b/$_pkgname.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git submodule update --init
}

build() {
	cd "$_pkgname"
    cd lazproj
    lazbuild -B dexeddesigncontrols.lpk
    lazbuild -B dexed.lpi
}

package() {
	cd "$_pkgname"
    install -Dm755 "bin/dexed" "${pkgdir}/usr/bin/dexed"
    install -Dm644 "bin/libdexed-d.so" "${pkgdir}/usr/lib/libdexed-d.so"
}

