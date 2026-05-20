# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=darling
pkgname=$_pkgname-bin
pkgver=0.1.20260222
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
source_x86_64=("${url}/releases/download/v${pkgver}/debs_${pkgver#0.1.}.zip")
sha256sums_x86_64=('9bc64151f10b005d46af2565714d07f7f2ccdc95100ccf75b4b2f65ba94dc821')
b2sums_x86_64=('b400e65778660ec55b449a6f77d36da77deca879c894eb74c8f194596d1fab87a03f7c26d5f2da533d871d29b7fe903e5d942c35e773a216198af77a2404bb86')
options=('!strip')
install=$pkgname.install

package() {
  cd $srcdir
  for deb in debs/*_${pkgver}~*.deb; do
    rm -f data.tar.zst
    bsdtar xf "$deb"
    (cd "$pkgdir"
    tar xf "${srcdir}/data.tar.zst")
  done
}
