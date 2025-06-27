pkgname=marco-git
pkgver=git_mainline
pkgrel=3
pkgdesc='Marco Window Manager, the Window Manager of MATE'
source=('git+https://github.com/mate-desktop/marco.git')
provides=('marco')
conflicts=('marco')
arch=('any')
license=('GPL-2.0')
makedepends=(
'glib2>=2.58.0' 'gtk3>=3.22.0' 'pango>=1.2.0' 'libcanberra>=3.22.0' 'mate-desktop>=1.27.1' 'libxres>=1.2.0' 'libx11' # From meson.build
'meson' 'ninja' 'git' # Normal makedepends
)
depends=(
'xorg-server' # Normal depends
)
optdepends=(
'mate-desktop' 'lightdm' # Normal optdepends
)
sha256sums=('SKIP')

build() {
  cd $srcdir/marco
  meson setup makepkg
  cd makepkg
  ninja -j$(nproc)
}

package() {
  cd $srcdir/marco/makepkg
  DESTDIR=$pkgdir ninja install -j$(nproc)
}