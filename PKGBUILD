# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.9.14
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
_llmqore_commit='ddbc38ffbd47d553774ec1895fce53911cf3da73'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "llmqore-$_llmqore_commit.tar.gz::https://github.com/Palm1r/llmqore/archive/$_llmqore_commit.tar.gz")
sha256sums=('164631c0e7836cd7d26804177b4a0fbefaddd33bd319a809c0a4001e37376b6e'
            '86def8e53a5dac68df561e8b5108cf5ac0d2b5be7887d64d72a9e28c388c2fea')

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
