# Maintainer: Jorge Martinez Hernandez <jorgemartinezhernandez@gmail.com>
# Contributor: Jorge Martinez Hernandez <jorgemartinezhernandez@gmail.com>

pkgname=feednix
pkgver=1.1
pkgrel=1
pkgdesc="A simple ncurses-based console client for Feedly"

arch=('i686' 'x86_64')
url="http://feednix-jarkore.rhcloud.com/"
license=('GPL3')
depends=('ncurses' 'curl' 'jsoncpp' 'autoconf' 'automake')
optdepends=('w3m: for post preview on command line')
makedepends=('autoconf' 'automake')
conflicts=('feednix-git')
install='feednix.install'
md5sums=('dd5aa9c550f7f229cc53ef7010523015'
        '28c0d860262dca62ef26c6cc15bdb650')
source=('https://github.com/Jarkore/Feednix/archive/v1.1.tar.gz'
        'bug.patch')

prepare(){
    cd ${srcdir}/Feednix-${pkgver}/src
    patch -uN < ${srcdir}/bug.patch 

}

build(){
    cd ${srcdir}/Feednix-${pkgver}/
    ./autogen.sh
    ./configure
    make
}

package(){
    cd ${srcdir}/Feednix-${pkgver}/
    make PREFIX=/usr DESTDIR="${pkgdir}" install

    if [[ ! -d "/etc/xdg/feednix" ]]; then
        install -D -m755 config.json "${pkgdir}/etc/xdg/feednix/config.json"
    fi 

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/feednix/LICENSE"
}
