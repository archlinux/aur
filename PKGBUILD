# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thedesk' 'td-polkitagent' 'thedesk-platform' 'libthedesk')
pkgver=beta3
pkgrel=1
pkgdesc="Desktop Environment built on Qt"
arch=("x86_64")
url="https://github.com/vicr123/thedesk"
license=('GPL3')
makedepends=('polkit-qt5' 'qt5-tools' 'the-libs' 'libtdesktopenvironment' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'modemmanager-qt' 'qt5-location' 'libtwebservices')
source=("thedesk-$pkgver"::'https://github.com/vicr123/thedesk/archive/beta3.tar.gz')
sha256sums=('cb38e02e6183bb8de13c6ac606723622b6d495c7a484f0451a8d353932955d8e')

doInstallModule() {
    pushd "$pkgbase-$pkgver/build/$1"
    make install INSTALL_ROOT=$pkgdir
    popd
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	qmake ..
	make
}

package_libthedesk() {
    depends=('the-libs' 'libtdesktopenvironment')
    
    doInstallModule 'libthedesk';
}

package_thedesk-platform() {
    depends=('the-libs' 'libx11')
    optdepends=('contemporary-widgets: Default Widget Theme'
                'contemporary-icons: Default Icon Theme'
                'ttf-contemporary: Default Font')
    
    doInstallModule 'platform'
}

package_td-polkitagent() {
    depends=('the-libs' 'polkit-qt5' 'libtdesktopenvironment')

    doInstallModule 'polkitagent';
}

package_thedesk() {
    depends=('the-libs' 'kwin' 'libtdesktopenvironment' 'td-polkitagent' 'libthedesk' 'thedesk-platform' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'modemmanager-qt' 'accountsservice' 'qt5-location' 'libtwebservices')
    
    doInstallModule 'desktop';
    doInstallModule 'plugins';
    doInstallModule 'startdesk';
}
