pkgname=linvst
pkgver=2.8.r85.105128a
pkgrel=1
pkgdesc="enables Windows vst's to be used as Linux vst's in Linux vst capable DAW's"
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
makedepends=('git')
source=('git+https://github.com/osxmidi/LinVst.git' 'https://download.steinberg.net/sdk_downloads/vstsdk3611_22_10_2018_build_34.zip')
sha256sums=('SKIP'
            'de64ff1b5b40a7fdc2de873e80d911ffa9fd6b82435a555dda1e8edc267d1fa3')

pkgver() {
    cd "LinVst"
    printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    ln -sf "${srcdir}/VST_SDK/VST2_SDK/pluginterfaces" "LinVst/"
}

build() {
    cd "${srcdir}/LinVst"
    make -f Makefile-64-32bit DESTDIR="${pkgdir}" all
}

package() {
    cd "${srcdir}/LinVst"
    make -f Makefile-64-32bit DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/lib/vst/"  install
}
