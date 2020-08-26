# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=chowtapemodel.lv2-git
pkgdesc="Physical modelling signal processing for analog tape recording."
pkgver=r102.a598bae
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/jatinchowdhury18/AnalogTapeModel"
license=(GPL)
groups=()
depends=('alsa-lib' 'libxcursor' 'libxinerama' 'libxrandr' 'freeglut' 'jack')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/jatinchowdhury18/AnalogTapeModel"
        "https://github.com/jatinchowdhury18/JUCE.git"
        "https://github.com/ffAudio/foleys_gui_magic.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$pkgname"
  rm -rf Juce/VST2_SDK
}

build() {
	cd "$pkgname"
  cd Plugin/ && bash build_linux.sh
}

package() {
	cd "$pkgname"
  mkdir -p "$pkgdir"/usr/lib/lv2/
  cp -r Plugin/Builds/LinuxMakefile/build/CHOWTapeModel.lv2 "$pkgdir"/usr/lib/lv2/
}
