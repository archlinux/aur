pkgname=psi-plus-plugins-qt5-git
pkgver=r468.708bb34
pkgrel=1
pkgdesc="Additional plugins for Psi+ (built with Qt 5.x)"
arch=('i686' 'x86_64')
url="http://psi-plus.com"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit' 'qt5-multimedia' 'psi-plus-qt5-git')
conflicts=('psi-plus-plugins-git')
makedepends=('libotr' 'tidyhtml')
optdepends=('libotr: for OTR plugin'
            'tidyhtml: for OTR plugin')
source=('psi-plus-plugins::git://github.com/psi-plus/plugins.git'
        'psiplugin.pri')
md5sums=('SKIP'
         'bbe29ce7c37a0511212798f17993c7dd')

pkgver() {
    cd psi-plus-plugins
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -v psiplugin.pri psi-plus-plugins/
}

build() {
    cd psi-plus-plugins

    for plugin in generic/* unix/*; do
        cd "$srcdir/psi-plus-plugins/$plugin"
        qmake-qt5 PREFIX="/usr" QMAKE_STRIP=
        make
    done
}

package() {
    cd psi-plus-plugins
    for plugin in generic/* unix/*; do
        cd "$srcdir/psi-plus-plugins/$plugin"
        make INSTALL_ROOT="$pkgdir" install
    done
}

md5sums=('SKIP'
         'c224bb773d98782c6dbaf4e27d560c60')
