pkgname=linvst
pkgver=2.3.r44.2a4b91e
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
makedepends=('git')
source=('git+https://github.com/osxmidi/LinVst.git' 'https://download.steinberg.net/sdk_downloads/vstsdk369_01_03_2018_build_132.zip')
sha256sums=('SKIP'
            '7c6c2a5f0bcbf8a7a0d6a42b782f0d3c00ec8eafa4226bbf2f5554e8cd764964')

pkgver() {
    cd "LinVst"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    ln -sf "${srcdir}/VST_SDK/VST2_SDK/pluginterfaces" "LinVst/"
}

build() {
    cd "${srcdir}/LinVst"
    make -f Makefile-embed-6432 DESTDIR="${pkgdir}" all
}

package() {
    cd "${srcdir}/LinVst"
    make -f Makefile-embed-6432 DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/lib/vst/"  install
}
