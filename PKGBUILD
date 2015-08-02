# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

_pkgname=qtcreator-freebox-plugin
pkgname=${_pkgname}-git
pkgver=r16.75afac6
pkgrel=1
pkgdesc="QtCreator Freebox Plugin"
groups=('qt' 'qt5')
arch=('i686' 'x86_64')
url='https://github.com/fbx/freebox-qtcreator-plugin'
license=('LGPL')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
# Prepare this package if ever there is a release of this tool
provides=('qtcreator-freebox-plugin')
conflicts=('qtcreator-freebox-plugin')
source=("$pkgname::git://github.com/fbx/freebox-qtcreator-plugin.git")
md5sums=('SKIP')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr qmake LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
    make
}

package() {
    cd $pkgname
    cp -r build/* ${pkgdir}
}
