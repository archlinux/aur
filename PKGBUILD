# Maintainer: zekoredump & gyfooya

pkgname="hyperfocusdsp-niner-bin"
pkgver="0.7.9"
pkgrel="1"
pkgdesc="Monophonic analogue kick drum synthesizer — VST3 plugin (prebuilt)"
arch=("x86_64")
url="https://github.com/hyperfocusdsp/niner"
license=("custom")

depends=(
  "glibc"
  "gcc-libs"
  "alsa-lib"
  "libx11"
  "libxext"
  "libxrandr"
  "libxinerama"
  "libxcursor"
  "libglvnd"
  "freetype2"
)

provides=("niner")
conflicts=("niner")

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/niner-linux-x86_64.tar.gz")

sha256sums=('e91cb82045ba078ebdc98ce54632f2a2d54cffc9f6d2e3bbb2b317f2771186f2')

package() {
  cd "$srcdir"

  # Find VST3 bundle inside extracted archive
  vst3_dir="$(find . -type d -name "*.vst3" -print -quit)"

  if [[ -z "$vst3_dir" ]]; then
    echo "ERROR: VST3 bundle not found in archive"
    return 1
  fi

  # Install VST3 plugin
  install -d "$pkgdir/usr/lib/vst3"
  cp -a "$vst3_dir" "$pkgdir/usr/lib/vst3/"
}
