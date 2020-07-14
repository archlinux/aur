# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thedesk' 'td-polkitagent' 'thedesk-platform' 'libthedesk')
pkgver=beta2
pkgrel=1
pkgdesc="Desktop Environment built on Qt"
arch=("x86_64")
url="https://github.com/vicr123/thedesk"
license=('GPL3')
makedepends=('polkit-qt5' 'qt5-tools' 'the-libs' 'libtdesktopenvironment' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'qt5-location' 'libtwebservices')
source=("thedesk-$pkgver"::'https://github.com/vicr123/thedesk/archive/beta2.tar.gz')
sha256sums=('101f57b8292483eb9b7a76665728d732f51b986b7e6590bb6416a2adef7abdf2')

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
    depends=('the-libs' 'kwin' 'libtdesktopenvironment' 'td-polkitagent' 'libthedesk' 'thedesk-platform' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'accountsservice' 'qt5-location' 'libtwebservices')
    
    doInstallModule 'desktop';
    doInstallModule 'plugins';
    doInstallModule 'startdesk';
}
