# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jekyll Wu <adaptee [at] gmail dot com >

pkgname=kcm-ufw
pkgver=0.4.3
pkgrel=3
pkgdesc="KDE4 control module for Ufw(Uncomplicated Firewall)"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/UFW+KControl+Module?content=137789"
license=('GPL')
depends=('ufw' 'kdebase-workspace' 'polkit-kde' 'openssl' 'python2' )
makedepends=('automoc4' 'cmake' 'docbook-xml' 'docbook-xsl')
source=("kcm_ufw-${pkgver}.tar.bz2::ftp://ftp.litnet.lt/gentoo/distfiles/kcm_ufw-${pkgver}.tar.bz2")
# Additional sources mirrors: http://www.filewatcher.com/m/kcm_ufw-0.4.3.tar.bz2.766909-0.html
md5sums=('97de867481948e3f54d76ca3678ffd2e')

build() {
    cd "${srcdir}/kcm_ufw-${pkgver}/"
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
    cd "${srcdir}/kcm_ufw-${pkgver}/build"
    make DESTDIR="${pkgdir}" install || return 1
}

