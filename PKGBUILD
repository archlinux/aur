# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.9.18
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
_llmqore_commit='68ecec3dc9fe2600eab20c53dad8327e8696dc60'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "llmqore-$_llmqore_commit.tar.gz::https://github.com/Palm1r/llmqore/archive/$_llmqore_commit.tar.gz")
sha256sums=('6036bfc8fc37e2f18175a453ad2775338e13e183a0ccf481585402904ce2690d'
            '95963851a0d67ae22075bb529ae65beebacb81d9a028a35054550e5d0ecd886d')

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
