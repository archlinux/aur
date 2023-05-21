# Maintainer: éclairevoyant

pkgname='waifu2x-converter-cpp'
pkgver=5.3.4
pkgrel=1
pkgdesc='Image super-resolution for anime-style art'
arch=(x86_64 i686)
url="https://github.com/DeadSix27/$pkgname"
license=(MIT)
depends=(ocl-icd opencv)
makedepends=(cmake git opencl-headers)
source=("git+$url.git?signed#commit=27ad20e6a2007d0415a7a1d7fc957e81395ab06b")
b2sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub (web-flow commit signing) <noreply@github.com>

build() {
	cmake -B build -S $pkgname \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_BUILD_TYPE='Release' \
		-DINSTALL_MODELS='ON' \
		-DOPENCV_PREFIX='/usr' \
		.
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
