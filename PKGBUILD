# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thedesk' 'td-polkitagent' 'thedesk-platform' 'libthedesk')
pkgver=beta1
pkgrel=1
pkgdesc="Desktop Environment built on Qt"
arch=("x86_64")
url="https://github.com/vicr123/thedesk"
license=('GPL3')
makedepends=('polkit-qt5' 'qt5-tools' 'the-libs' 'libtdesktopenvironment' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt')
source=("thedesk-$pkgver"::'https://github.com/vicr123/thedesk/archive/beta1.tar.gz')
sha256sums=('cc9860962a637f1d40d38b9461e970c2b7694a235d1d974a2aea3ba75f45c85f')

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
    depends=('the-libs' 'kwin' 'libtdesktopenvironment' 'td-polkitagent' 'libthedesk' 'thedesk-platform' 'pulseaudio-qt' 'libx11' 'libxi' 'xf86-input-libinput' 'networkmanager-qt' 'accountsservice')
    
    doInstallModule 'desktop';
    doInstallModule 'plugins';
    doInstallModule 'startdesk';
}
