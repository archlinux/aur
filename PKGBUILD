# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=lightdm-arctica-greeter
pkgver=0.99.5.0
pkgrel=1
pkgdesc="The greeter (login screen) application for Arctica. It is implemented as a LightDM greeter."
arch=(i686 x86_64)
url="https://github.com/ArcticaProject/arctica-greeter/"
license=(GPL3 LGPL3)
groups=(unity)
depends=(cantarell-fonts ayatana-ido libayatana-indicator lightdm
         libcanberra libxext python python-gobject)
makedepends=(mate-common mate-settings-daemon marco imagemagick
             intltool librsvg vala libpam-x2go libpam-freerdp2)
optdepends=("mate-themes: mate themes")
source=("https://github.com/ArcticaProject/arctica-greeter/archive/"$pkgver".tar.gz")
sha512sums=('eaf3a25b6855b088d745b23afa10c74cc0a6c6b0426fe6d9aa2f54ef52b762c935a033e2bc04e91a69f54aa5be9bb19fe159a8777fc7954f6b7f1611815ab4da')

build() {
    cd "arctica-greeter-${pkgver}"

    ./autogen.sh \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/lightdm

    make
}

package() {
    cd "arctica-greeter-${pkgver}"

    make DESTDIR="${pkgdir}" install


    # Use language packs
    rm -r "${pkgdir}/usr/share/locale/"
}
