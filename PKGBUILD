# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=lightdm-arctica-greeter
pkgver=0.99.8.3
pkgrel=1
pkgdesc="The greeter (login screen) application for Arctica. It is implemented as a LightDM greeter."
arch=(i686 x86_64)
url="https://github.com/ArcticaProject/arctica-greeter/"
license=(GPL3 LGPL3)
groups=(unity)
depends=(cantarell-fonts ayatana-ido libayatana-indicator lightdm
         libcanberra libxext python python-gobject)
makedepends=(mate-common mate-settings-daemon marco imagemagick
             intltool librsvg vala)
optdepends=("mate-themes: mate themes")
source=("https://github.com/ArcticaProject/arctica-greeter/archive/"$pkgver".tar.gz")
sha512sums=('22f179c82786823182f3e0efc146d23e1cebc6d04f657d0666f96e0a82587637dcee330e091f5d6b0e0469622d0be7910c9bac736657c258e65b744dfcbe0b84')

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
