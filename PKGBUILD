# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jekyll Wu <adaptee [at] gmail dot com >

pkgname=kcm-ufw
pkgver=0.4.3
pkgrel=4
pkgdesc="KDE4 control module for UFW (Uncomplicated Firewall)"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/UFW+KControl+Module?content=137789"
license=('GPL')
depends=('ufw' 'kdebase-runtime' 'polkit-kde' 'openssl' 'python2' )
makedepends=('automoc4' 'cmake' 'docbook-xml' 'docbook-xsl')
source=("${pkgname}.zip::https://github.com/youngunix/${pkgname}/archive/master.zip")
sha256sums=('8654cf8263ec8915278ccf93a0eee5ef7773a4be39f6a26a595f8716606b364a')

build() {
    cd "${pkgname}-master"
    if [ -d build ] ; then
        rm build -rf
    fi
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
    make
    sed -i '1s/\<python\>/python2/' ./kcm_ufw_helper.py
}

package() {
    cd "${pkgname}-master/build"
    make DESTDIR="${pkgdir}" install || return 1
}

