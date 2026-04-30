# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=qtcreator-qodeassist-plugin
pkgver=0.9.13
pkgrel=2
pkgdesc="QodeAssist is an AI-powered coding assistant plugin for Qt Creator"
groups=('qt')
arch=('x86_64')
url="https://github.com/Palm1r/QodeAssist"
license=('GPL-3.0-only')
provides=('qodeassist' 'QodeAssist')
conflicts=('qodeassist' 'QodeAssist')
depends=("qtcreator")
makedepends=('cmake' "qtcreator-devel>=18.0.2")
_llmqore_commit='82067dc46a56221b1e2e38967a5ac67265685fa9'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz"
        "llmqore-$_llmqore_commit.tar.gz::https://github.com/Palm1r/llmqore/archive/$_llmqore_commit.tar.gz")
sha256sums=('30025e59b001de217ae393ebc5ac9e75570561121bab6d105b9c10a0319fa46d'
            '774dacf2cb30c2b739546c53d99f490714e760dc95b0a7d112a3c62da24c7171')

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
