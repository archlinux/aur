# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thedesk' 'td-polkitagent' 'thedesk-platform' 'libthedesk')
pkgver=beta4
pkgrel=3
pkgdesc="Desktop Environment built on Qt"
arch=("x86_64")
url="https://github.com/vicr123/thedesk"
license=('GPL3')
makedepends=('polkit-qt5' 'qt5-tools' 'the-libs' 'libtdesktopenvironment' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'modemmanager-qt' 'qt5-location' 'libtwebservices' 'bluez-qt' 'qrencode')
source=("thedesk-$pkgver"::'https://github.com/vicr123/thedesk/archive/beta4.tar.gz')
sha256sums=('fba59e6a6aa9940728f6e6e5db61445f44fbcc0adfa8b2f30f3e4c7649f4ac29')

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
    depends=('the-libs' 'kwin' 'libtdesktopenvironment' 'td-polkitagent' 'libthedesk' 'thedesk-platform' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'modemmanager-qt' 'accountsservice' 'qt5-location' 'libtwebservices' 'bluez-qt' 'qrencode' 'thedesk-xdg-utils')
    
    doInstallModule 'desktop';
    doInstallModule 'plugins';
    doInstallModule 'startdesk';
}
