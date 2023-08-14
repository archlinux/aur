# Maintainer: PerilousBooklet <raffaele.orabona at protonmail dot com>
# Contributor: dalz <aur @t alsd d0t eu>
# Contributor: Jorge Araya Navarro <jorgejavieran@yahoo.com.mx>
# Contributor: Cristian Porras <porrascristian@gmail.com>
# Contributor: Matthew Bentley <matthew@mtbentley.us>
 
pkgname=godot-voxel
pkgver=4.0.3
pkgrel=3
pkgdesc="The voxel tools module made by Zylann for the Godot game engine."
url="https://voxel-tools.readthedocs.io/"
license=('MIT')
arch=('x86_64')
makedepends=('scons' 'git')
depends=('pkgconf' 'libxcursor' 'libxinerama' 'libxi' 'libxrandr' 'mesa' 'glu' 'libglvnd' 'alsa-lib' 'pulseaudio')
source=("godot::git+https://github.com/godotengine/godot.git#commit=5222a99f5d38cd5346254cefed8f65315bca4fcb"
        "voxel::git+https://github.com/Zylann/godot_voxel.git#commit=3e2d236a0eb85e7bb7381d7f465fecfb42fe19e8"
        "$pkgname.desktop" )
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  ln -s "$srcdir/voxel" "$srcdir/godot/modules/voxel"
  
  # Source: https://github.com/Zylann/godot_voxel/commit/13567b4fb8f20ca0b5dcf71e76c9c7a6452dc5ca
  cd voxel
  git cherry-pick -n 13567b4fb8f20ca0b5dcf71e76c9c7a6452dc5ca
}

build() {
  cd $srcdir/godot
  scons platform=linuxbsd colored=yes
}

package() {
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $srcdir/godot/icon.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
  install -Dm755 $srcdir/godot/bin/godot.linuxbsd.editor.x86_64 $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/godot/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/godot/misc/dist/linux/godot.6 "$pkgdir"/usr/share/man/man6/$pkgname.6
}
