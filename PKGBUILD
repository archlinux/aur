# Maintainer: PerilousBooklet <raffaele.orabona at protonmail dot com>
# Contributor: dalz <aur @t alsd d0t eu>
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
 
pkgname=godot-voxel
pkgver=4.1.0
pkgrel=1
pkgdesc="The Godot game engine with Zylann's voxel tools module"
url="https://voxel-tools.readthedocs.io/en/latest/"
license=('MIT')
arch=('x86_64')
makedepends=('scons' 'gcc')
depends=('pkgconf' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'mesa' 'glu' 'libglvnd' 'alsa-lib' 'pulseaudio')
source=("godot::git+https://github.com/godotengine/godot.git"
        "godot_voxel::git+https://github.com/Zylann/godot_voxel.git"
        "godot-voxel.desktop" )
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}" 
  ln -s "$srcdir/godot_voxel" "$srcdir/godot/modules/voxel"
}

build() { 
  cd "${srcdir}/godot"
  scons platform=linuxbsd colored=yes
}

package() {
  cd ${srcdir}
  install -Dm644 ${srcdir}/godot-voxel.desktop "${pkgdir}"/usr/share/applications/godot-voxel.desktop
  install -Dm644 "${srcdir}"/godot/icon.svg "${pkgdir}"/usr/share/pixmaps/godot-voxel.svg

  cd "${srcdir}"/godot
  install -D -m755 ./bin/godot.linuxbsd.editor.x86_64 "${pkgdir}"/usr/bin/godot-voxel
  #install -D -m644 "${srcdir}"/godot/LICENSE.txt "${pkgdir}"/usr/share/licenses/godot/LICENSE
  #install -D -m644 "${srcdir}"/godot/misc/dist/linux/godot.6 "${pkgdir}"/usr/share/man/man6/godot.6
}

