# Maintainer: Talon <diablodev@googlegroups.com>
pkgname=astro8-computer
pkgver=3.4.3_alpha
pkgrel=1
pkgdesc="Custom 16-bit homebrew CPU, emulator, renderer, PCB, and language"
arch=("x86_64")
url="https://github.com/sam-astro/Astro8-Computer"
license=("MIT")
depends=("sdl2")
makedepends=("cmake")
source=("$pkgname.tar.gz::https://github.com/sam-astro/Astro8-Computer/archive/refs/tags/v3.4.3-alpha.tar.gz")
sha512sums=('SKIP')

prepare()
{
	ln -sf "Astro8-Computer-3.4.3-alpha" "$srcdir/$pkgname"
	mkdir -p "$srcdir/$pkgname/build"
	cmake -S "$srcdir/$pkgname/Astro8-Emulator" -B "$srcdir/$pkgname/build" -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 # Minimum Version flag set since upstream uses an old CMake Version.
}

build()
{
	cd "$srcdir/$pkgname/build"
	make
}

package()
{
	install -dm755 "$pkgdir/usr/bin"
	install  -m755 "$srcdir/$pkgname/build/astro8" "$pkgdir/usr/bin/astro8"
}
