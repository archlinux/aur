# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-texworks
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: Erdbeerkaese <erdbeerkaese@gmx.net>
# Contributor: Michael Pfeuti

pkgname=texworks
pkgver=0.6.0
pkgrel=1
pkgdesc="A TeX IDE inspired by TeXShop."
arch=('i686' 'x86_64')
url="http://tug.org/texworks"
license=('GPL2')
depends=('poppler-qt4' 'hunspell' 'desktop-file-utils')
optdepends=('texlive-core: Support for typesetting'
            'lua: Support for Lua scripting/plugins'
            'python: Support for Python scripting/plugins')
makedepends=('cmake' 'hardening-wrapper' 'lua' 'python')
provides=('texworks')
conflicts=('texworks-svn')
install=texworks.install
source=("https://github.com/TeXworks/${pkgname}/archive/release-${pkgver}.tar.gz")
sha256sums=('abb0dd76fe8870d0caa83f8f98743b44b6d5ce6e4df406e47eb6d0ffc2559f7b')

build() {
    cd $pkgname-release-$pkgver
    cmake \
        -DTW_BUILD_ID="AUR" \
        -DWITH_LUA="ON" \
        -DWITH_PYTHON="ON" \
        -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
    make
}

package() {
    cd $pkgname-release-$pkgver
    make install
}
