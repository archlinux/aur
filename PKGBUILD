# Maintainer: LandWarderer2772 <navaneethbinoy@gmail.com>

pkgname=yapfast-bin
pkgver=0.4.1
pkgrel=1
pkgdesc='Native Discord client that stays light on memory (prebuilt binary)'
arch=('x86_64')
url='https://yapfast.com'
license=('GPL-3.0-or-later')
provides=('yapfast')
conflicts=('yapfast')
options=('!strip' '!debug')

# DT_NEEDED carries glibc, libstdc++, libgcc, glib2, libpulse, fontconfig.
# Windowing (Wayland / X11) and WebRTC audio (alsa-lib) are loaded dynamically via dlopen at runtime.
depends=(
  alsa-lib
  fontconfig
  glib2
  glibc
  hicolor-icon-theme
  libgcc
  libpulse
  libstdc++
  libx11
  libxcb
  libxcursor
  libxi
  libxkbcommon
  libxkbcommon-x11
  wayland
)

optdepends=(
  'vulkan-icd-loader: drawing with the GPU (Settings, Render with the GPU)'
  'libglvnd: drawing with the GPU through OpenGL, where there is no Vulkan'
  'pipewire: screen sharing through the desktop portal'
  'libdrm: screen sharing through the desktop portal'
  'mesa: screen sharing through the desktop portal (libgbm)'
  'libva: encoding streams on AMD and Intel GPUs (VA-API)'
  'intel-media-driver: encoding streams on Intel GPUs'
  'libxcomposite: screen sharing on X11'
  'libxdamage: screen sharing on X11'
  'libxext: screen sharing on X11'
  'libxfixes: screen sharing on X11'
  'libxrandr: screen sharing on X11'
)

source=("https://github.com/yapfast/yapfast/releases/download/v${pkgver}/yapfast-${pkgver}-1-${CARCH}.pkg.tar.zst")
sha256sums=('13eed7866069851f3ffd5ecf98c7e2ceeb967caccd5b1e5e9cd058279b22d310')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  chmod -R u=rwX,go=rX "$pkgdir/usr"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/doc/yapfast/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
