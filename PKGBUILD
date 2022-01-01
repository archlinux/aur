# Maintainer: Apoorv <apoorvs569@gmail.com>

pkgname=monique-monosynth-git
_pkgname=monique-monosynth
pkgver=1
pkgrel=1
pkgdesc="Monique is a monophonic synth from Thomas Arndt"
arch=('x86_64')
url="https://github.com/surge-synthesizer/monique-monosynth"
license=('GPLv3 or MIT')
makedepends=('git' 'cmake')
source=("git+$url")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
  git -C libs/JUCE checkout 6.1.2
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=1
  make -C build
}

package() {
  cd "$srcdir/$_pkgname"
  sudo cp -r build/MoniqueMonosynth_artefacts/Release/VST3/MoniqueMonosynth.vst3/ /usr/lib/vst3/
  sudo cp -r build/MoniqueMonosynth_artefacts/Release/Standalone/MoniqueMonosynth /usr/bin/
}