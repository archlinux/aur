# Maintainer: SpaghettiCat <d_the_m101 at yahoo dot co dot uk>
# Based on "gargoyle" package maintained by:
#     Beej <beej@beej.us>
#     Michael Smith <michael at diglumi dot com>
#     Marcin Skory <armitage at q84fh dot net>
#     with Contribution of Eric Forgeot < http://ifiction.free.fr >
pkgname=gargoyle-git
pkgver=2022.1.r563.gbde657b4
pkgrel=1
pkgdesc="Interactive Fiction multi-interpreter that supports all major IF formats (development version)"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/garglk/garglk"
license=('GPL')
depends=('sdl2_mixer' 'sdl2' 'freetype2' 'qt5-base' 'fontconfig' 'libjpeg' 'libpng')
makedepends=('cmake' 'pkgconfig' 'desktop-file-utils' 'git' 'fmt')
optdepends=('speech-dispatcher: text-to-speech support')
provides=('gargoyle-git')
conflicts=('gargoyle-mod' 'gargoyle')
replaces=('gargoyle-mod' 'gargoyle')
groups=(inform)
source=("$pkgname::git+https://github.com/garglk/garglk.git" "gargoyle-git.install")
install=${pkgname}.install
sha512sums=('SKIP'
            '1fa602865745c1c9801178ee9b24be86215f2af4f9ee3f4f3b3c0606a87aba32a67c9c5343b481332c8fc97ff6c1a5e447f074d116c0cc5b255af35098096e6e')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S "${pkgname}" -B "build" -DWITH_TTS=DYNAMIC -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
	cmake --build "build"
}

package() {
	cmake --install "build"
	# Install default config
	install -Dm755 "$srcdir/${pkgname}/garglk/garglk.ini" "$pkgdir/etc/garglk.ini"
}
