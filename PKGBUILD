# Maintainer: shizhiex <shizhiex@gmail.com>

pkgname="orca-slicer"
pkgver=2.3.1.c6b8664c8e276413445e
_commit='c6b8664c8e276413445ed25d3a8957101143c006'
pkgrel=1
pkgdesc="Orca Slicer is a fork of Bambu Studio. It was previously known as BambuStudio-SoftFever"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'ttf-harmonyos-sans' 'gst-plugins-base')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'm4' 'pkgconf')
provides=("orca-slicer")
conflicts=("orca-slicer")
source=(
  "git+https://github.com/SoftFever/OrcaSlicer.git#commit=${_commit}"
  "orca-slicer.sh"
  )
sha256sums=(
  'SKIP'
  '7478461e3e625e87bff32502b56e13b0ed46192c578194bdc979036161080450'
)

build() {
  # deps
  cd "$srcdir/OrcaSlicer"
  ./BuildLinux.sh -d -j4
  ./BuildLinux.sh -s -j4
}

package() {
  echo "Entering directory $srcdir/OrcaSlicer/build/package/bin."
  install -d "$pkgdir/usr/bin"
  cd "$srcdir/OrcaSlicer/build/package/bin"
  install "orca-slicer" "$pkgdir/usr/bin/orca-slicer-bin"

  echo "Entering directory $srcdir/OrcaSlicer/build/package."
  cd "$srcdir/OrcaSlicer/build/package"
  find resources -type f -exec install -D {} "$pkgdir/usr/{}" \;

  echo "Entering directory $srcdir/OrcaSlicer/doc."
  cd "$srcdir/OrcaSlicer/doc"
  install -D -t "$pkgdir/usr/share/doc/$pkgname" *.md

  install "$srcdir/orca-slicer.sh" "$pkgdir/usr/bin/orca-slicer"
}
