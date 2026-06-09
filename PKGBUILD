# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.9.20
pkgrel=1
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator"
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
provides=('qodeassist' 'QodeAssist')
conflicts=('qodeassist' 'QodeAssist')
depends=("qtcreator")
makedepends=('cmake' "qtcreator-devel>=18.0.2")
_llmqore_commit='48e6dfb30db49162f5ebbdbedaa9049f5cfd077c'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "llmqore-$_llmqore_commit.tar.gz::https://github.com/Palm1r/llmqore/archive/$_llmqore_commit.tar.gz")
sha256sums=('048d136108d0cbc0f7d4f6433e1537000a807e9913cf05b470dc7b74b1c1c0bd'
            'a8f519455cbdcb778006695834377d8469a9e11ae0caa4585c7d85761230b3fa')

prepare() {
    rm -r "$srcdir/QodeAssist-$pkgver/sources/external/llmqore"
    ln -s "$srcdir/llmqore-$_llmqore_commit" "$srcdir/QodeAssist-$pkgver/sources/external/llmqore"
}

build() {
    cmake -S QodeAssist-$pkgver -B build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
