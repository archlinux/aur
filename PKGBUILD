# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: Erdbeerkaese <erdbeerkaese@gmx.net>
# Contributor: Michael Pfeuti

pkgname=texworks
pkgver=0.6.2
pkgrel=3
pkgdesc='A TeX IDE inspired by TeXShop.'
arch=('i686' 'x86_64')
url='https://www.tug.org/texworks/'
license=('GPL2')
depends=('desktop-file-utils' 'hunspell' 'poppler-qt5' 'qt5-script')
optdepends=('texlive-core: Support for typesetting'
            'lua: Support for Lua scripting/plugins'
            'python: Support for Python scripting/plugins')
makedepends=('cmake' 'lua' 'python' 'qt5-tools')
provides=('texworks')
conflicts=('texworks-svn')
source=("https://github.com/TeXworks/${pkgname}/archive/release-${pkgver}.tar.gz")
sha256sums=('22885c11d92654b0cba1f4808fc9aa3c2fdd3e5435fd89dff9aa1e67658a6339')

build() {
    cd "$pkgname-release-$pkgver"
    cmake \
        -DTW_BUILD_ID='AUR' \
        -DWITH_LUA='ON' \
        -DWITH_PYTHON='ON' \
        -DDESIRED_QT_VERSION:STRING=5 \
        -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
    make
}

package() {
    cd "$pkgname-release-$pkgver"
    make install
}
