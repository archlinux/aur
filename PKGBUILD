# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=$_pkgname-bin
pkgver=0.1.20260608
pkgrel=1
pkgdesc="Darwin/macOS emulation layer for Linux"
arch=('x86_64')
url="https://github.com/${_pkgname}hq/${_pkgname}"
license=('GPL3')
groups=('darling-bin')
provides=('darling')
conflicts=('darling' 'darling-git')
depends=(
  cairo
  dbus
  ffmpeg
  freetype2
  fuse2
  giflib
  glibc
  glu
  libgl
  libglvnd
  libjpeg-turbo
  libpng
  libpulse
  libtiff
  libx11
  libxcursor
  libxext
  libxkbfile
  libxrandr)
optdepends=('libtiff5: Library for manipulation of TIFF images')
source=("${url}/releases/download/v${pkgver}/debs_${pkgver#0.1.}.zip")
sha256sums=('27469ef3932da2e91dd7fb34b70e3628a3e54b7af9fb5480051f44af35eca1fd')
options=('!strip')
install=$pkgname.install

package() {
  cd $srcdir
  for deb in debs*/*_*.deb; do
    rm -f data.tar.zst
    bsdtar xf "$deb"
    (cd "$pkgdir"
    tar xf "${srcdir}/data.tar.zst")
  done
}
