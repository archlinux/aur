# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Zuf <kontakt.zuf(at)gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=macrofusion
pkgver=0.7.4
pkgrel=4
pkgdesc="GUI to combine photos to get deeper DOF or HDR"
url="http://sourceforge.net/projects/macrofusion/"
depends=('python-cairo' 'python-gobject' 'python-pillow' 'perl-image-exiftool' 'enblend-enfuse' 'hugin' 'libgexiv2')
arch=('any')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}/${pkgname}_${pkgver}.orig.tar.gz")
license=('GPL')
install=$pkgname.install
sha256sums=('2d061f0a2e858c86ae700351cf9785bc7058938e02ce6fcf40b192fbb0b60b11')

package() {
    # Installation is a bit tricky. See README and parts of the python script to see
    # where everything should go to. A makefile would have been nice.

    cd ${srcdir}/${pkgname}-${pkgver}

    # install ui descriptions
    install -dm755 $pkgdir/usr/share/mfusion/ui
    install -Dm644 ui/* $pkgdir/usr/share/mfusion/ui/

    # images have to be split up manually. Irghs...
    install -Dm644 images/logoSplash.png $pkgdir/usr/share/mfusion/images/logoSplash.png
    install -Dm644 images/$pkgname.png   $pkgdir/usr/share/pixmaps/$pkgname.png

    # actual python script and desktop file
    install -Dm755 $pkgname.py $pkgdir/usr/bin/$pkgname
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    # for some languages there is localization available
    for locale in locale/*; do
        install -dm755 $pkgdir/usr/share/$locale/LC_MESSAGES
        install -Dm644 $locale/LC_MESSAGES/* $pkgdir/usr/share/$locale/LC_MESSAGES/
    done
}
