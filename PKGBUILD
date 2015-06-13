# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-texworks
# Contributor: Dan Vratil <dan@progdan.cz>
# Contributor: Erdbeerkaese <erdbeerkaese@gmx.net>
# Contributor: Michael Pfeuti

pkgname=texworks
pkgver=0.4.6
pkgrel=2
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
source=("https://github.com/TeXworks/texworks/archive/release-${pkgver}.tar.gz")
sha256sums=('58650574c1e3234c38cddc3375f8043a83cc65075839030fc7089471af6a3bde')

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

