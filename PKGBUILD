# Maintainer: VienC
# NOTE: This pulls the binary (already build) from 3rd party mirror

: ${_pkgver:=0.4.4}

# Basic INFO
_pkgname="simplescreenrecorder"
pkgname="$_pkgname-bin"
pkgver=0.4.4
pkgrel=1
pkgdesc="A simple but powerful recording tool for X11, OpenGL and V4L2. (Git version)"
url="https://github.com/MaartenBaert/ssr"
arch=('x86_64')
license=('GPL3')
depends=("qt5-base" "qt5-x11extras"
    "ffmpeg" "alsa-lib" "libpulse" "jack" "libgl" "glu" "v4l-utils"
    "libx11" "libxext" "libxfixes" "libxi" "libxinerama"
    "desktop-file-utils" "gtk-update-icon-cache")
makedepends=()
optdepends=("lib32-simplescreenrecorder-git: OpenGL recording of 32-bit applications")

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=("$_pkgname")
  conflicts=("$_pkgname" "simplescreenrecorder-git")
fi

options=('!emptydirs' '!strip')
install="$_pkgname.install"
#        https://builds.garudalinux.org/repos/chaotic-aur/x86_64/simplescreenrecorder-0.4.4-2.1-x86_64.pkg.tar.zst
#        https://builds.garudalinux.org/repos/chaotic-aur/x86_64/simplescreenrecorder-git-0.4.4-2.1-x86_64.pkg.tar.zst
_dl_url="https://builds.garudalinux.org/repos/chaotic-aur/x86_64/simplescreenrecorder-${_pkgver}-2.1-x86_64.pkg.tar.zst"
_dl_filename="simplescreenrecorder-${_pkgver}-2.1-x86_64.pkg.tar.zst"

source=(
  "https://builds.garudalinux.org/repos/chaotic-aur/x86_64/$_dl_filename"
)
sha256sums=(
  'bbdb4580031854522d57490b15d99522f0d60913308646a8712d51cd6e433f21'
)

pkgver() {
  printf '%s' "$_pkgver"
}


package() {
  mkdir -p "$srcdir/tmp_pkg"
  tar -xvf "$srcdir/$_dl_filename" -C "$srcdir/tmp_pkg"
  cp -r "$srcdir/tmp_pkg"/* "$pkgdir/"
}

