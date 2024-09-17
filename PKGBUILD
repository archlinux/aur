# Maintainer: omarhanykasban <omarhanykasban706@gmail.com>

pkgname=gamescope-legacy-bin
pkgver=3.14.2
pkgrel=1
pkgdesc="Legacy version of SteamOS session compositing window manager"
arch=('x86_64')
url=https://github.com/ValveSoftware/gamescope
license=(
  BSD-2-Clause
  BSD-3-Clause
  LicenseRef-Reshade
)
depends=(
  gcc-libs
  glibc
  lcms2
  libavif
  libcap.so
  libdecor
  libdrm
  libei
  libinput
  libpipewire-0.3.so
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxkbcommon.so
  libxmu
  libxrender
  libxres
  libxtst
  libxxf86vm
  pixman
  sdl2
  seatd
  systemd-libs
  vulkan-icd-loader
  wayland
  xcb-util-errors
  xcb-util-wm
  xorg-server-xwayland
  wlroots0.17
  libliftoff
)
makedepends=(
  libdisplay-info
)

source_x86_64=("https://repos.fyralabs.com/terra40/gamescope-legacy-0:${pkgver}-1.fc40.x86_64.rpm")
sha256sums_x86_64=('610725988259168bd7b21218a4e7c30f1d4e552aee8e5d65b383668f449779e5')

build() {
    # Extract the RPM package
    bsdtar -xvf "${srcdir}/gamescope-legacy-0:${pkgver}-1.fc40.x86_64.rpm"
}

package() {
    cd "${srcdir}"
    # Install extracted files
    install -Dm755 usr/bin/gamescope-legacy "$pkgdir/usr/bin/gamescope-legacy"
    install -Dm644 usr/lib/.build-id/fa/b195402147dd6727bdbd4801f979ec61b9ff6c "$pkgdir/usr/lib/.build-id/fa/b195402147dd6727bdbd4801f979ec61b9ff6c"
    install -Dm644 usr/share/doc/gamescope-legacy/README.md "$pkgdir/usr/share/doc/gamescope-legacy/README.md"
    install -Dm644 usr/share/licenses/gamescope-legacy/LICENSE "$pkgdir/usr/share/licenses/gamescope-legacy/LICENSE"
    # Create symbolic link for libdisplay-info
    ln -s /usr/lib/libdisplay-info.so.0.2.0 "$pkgdir/usr/lib/libdisplay-info.so.1"
}
