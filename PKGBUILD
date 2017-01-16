# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: Erdbeerkaese <erdbeerkaese@gmx.net>
# Contributor: Michael Pfeuti

pkgname=texworks
pkgver=0.6.1
pkgrel=2
pkgdesc='A TeX IDE inspired by TeXShop.'
arch=('i686' 'x86_64')
url='http://tug.org/texworks'
license=('GPL2')
depends=('desktop-file-utils' 'hunspell' 'poppler-qt5' 'qt5-script')
optdepends=('texlive-core: Support for typesetting'
            'lua: Support for Lua scripting/plugins'
            'python: Support for Python scripting/plugins')
makedepends=('cmake' 'hardening-wrapper' 'lua' 'python' 'qt5-tools')
provides=('texworks')
conflicts=('texworks-svn')
source=("https://github.com/TeXworks/${pkgname}/archive/release-${pkgver}.tar.gz")
sha256sums=('6b8ed503633f18d04086002d837b5c306b0bffbf548161c803d287bc6a6446ae')

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
