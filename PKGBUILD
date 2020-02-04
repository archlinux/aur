# Maintainer: Jeff Wright <jeff@teamjk.page>
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>

pkgname=godot-pulse-vulkan-git
_pkgname=godot
pkgver=latest
pkgrel=1
pkgdesc="An advanced, feature packed, multi-platform 2D and 3D game engine, vulkan dev branch"
url="http://www.godotengine.org"
license=('MIT')
arch=('x86_64')
makedepends=('scons' 'gcc' 'yasm')
depends=('libxcursor' 'libxinerama' 'freetype2' 'pulseaudio' 'libxrandr' 'libxi' 'libglvnd')
conflicts=("godot-git" "godot" "godot-pulse")
provides=("godot")

source=(
	"git://github.com/godotengine/${_pkgname}.git#branch=vulkan"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}"/godot

  scons platform=x11 \
        tools=yes \
        target=release_debug \
        use_llvm=no \
        colored=yes \
        pulseaudio=yes bits=64 -j $((`nproc`+1))
}

package() {

  cd "${srcdir}"/godot

  install -Dm644 misc/dist/linux/org.godotengine.Godot.desktop "${pkgdir}"/usr/share/applications/godot.desktop
  install -D -m755 bin/godot.x11.opt.tools.64 "${pkgdir}"/usr/bin/godot
  install -D -m644 LICENSE.txt "${pkgdir}"/usr/share/licenses/godot/LICENSE
  install -D -m644 misc/dist/linux/godot.6 "${pkgdir}"/usr/share/man/man6/godot.6
}
