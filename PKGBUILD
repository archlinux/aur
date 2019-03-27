# Maintainer: Adrien Jussak <adrien.jussak@wascardev.com>

pkgname="prime-switcher"
pkgver=1.0.2
pkgrel=1
pkgdesc="Tool (GUI  + CLI) to select used GPU for Optimus Laptop"
arch=('any')
url='https://gitlab.com/tuxnvape/prime-switcher'
depends=('python-gobject' 'libappindicator-gtk3' 'gtk3' 'libnotify' 'mesa-demos' 'gettext')
optdepends=('bbswitch: For power saving with NVIDIA discrete GPU')
license=('GPLv3')
install=prime-switcher.install

source=("https://gitlab.com/tuxnvape/prime-switcher/-/archive/v${pkgver}/prime-switcher-v${pkgver}.tar.gz")

sha256sums=('bd9bc595e026ed1a9445cf6b4a3696724ffcf7a1e390fc743332a9261a578135')

build() {
	_src="${srcdir}/${pkgname}-v${pkgver}"
    find ${_src}/locales -name \*.po -execdir msgfmt prime-switcher.po -o prime-switcher.mo \;
}

package() {
	_src="${srcdir}/${pkgname}-v${pkgver}"
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mkdir -p ${pkgdir}/usr/lib/${pkgname}
    mkdir -p ${pkgdir}/etc/${pkgname}
    mkdir -p ${pkgdir}/usr/share/locale
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/
    mkdir -p ${pkgdir}/etc/xdg/autostart/

    cp -r ${_src}/configs/* ${pkgdir}/etc/${pkgname}/
    cp -r ${_src}/assets/* ${pkgdir}/usr/share/${pkgname}
    cp ${_src}/src/* ${pkgdir}/usr/lib/${pkgname}
    cp -r ${_src}/icons/* ${pkgdir}/usr/share/icons/hicolor/
    ln -s ../lib/${pkgname}/__main__.py ${pkgdir}/usr/bin/${pkgname}
    cp ${_src}/prime-switcher.desktop ${pkgdir}/etc/xdg/autostart/
    
   	cd ${_src}/locales/
    find . -name '*.mo' -exec cp --parents \{\} ${pkgdir}/usr/share/locale/ \;
}

