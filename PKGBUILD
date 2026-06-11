# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=$_pkgname-bin
pkgver=0.1.20260608
_pkgver=0.1.20260609
pkgrel=2
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
source_x86_64=("${url}/releases/download/v${pkgver}/debs_${pkgver#0.1.}.zip")
sha256sums_x86_64=('27469ef3932da2e91dd7fb34b70e3628a3e54b7af9fb5480051f44af35eca1fd')
b2sums_x86_64=('69522ed5c75597c5f2921bf3ee656deb2ed16949cb588632355622dbb0b97cbced5c8950334828ca962c680ea56393680503e647f018671565e66ec3f2a4acc3')
options=('!strip')
install=$pkgname.install

package() {
  cd $srcdir
  for deb in debs_${_pkgver#0.1.}/*_${_pkgver}~*.deb; do
    rm -f data.tar.zst
    bsdtar xf "$deb"
    (cd "$pkgdir"
    tar xf "${srcdir}/data.tar.zst")
  done
}
