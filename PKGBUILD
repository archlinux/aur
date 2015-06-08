# Maintainer: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: hobbypunk <hoppe.marcel at gmail dot com>

pkgname=plymouth-theme-gnome-logo
_srcname=ubuntu-gnome-default-settings
pkgver=15.04.5
pkgrel=1
pkgdesc="GNOME Plymouth Theme"
arch=('any')
url="http://packages.ubuntu.com/vivid/plymouth-theme-ubuntu-gnome-logo"
license=('GPL')
depends=('plymouth')
install='plymouth-theme-gnome-logo.install'
source=("http://archive.ubuntu.com/ubuntu/pool/universe/u/${_srcname}/${_srcname}_${pkgver}.tar.xz"
        'plymouth-theme-gnome-logo.install'
        'rename.patch')
sha256sums=('d0a57ec1596d9d6551a7dd4e73795c077509261d70bb9f7480b3a1f704dc1b23'
            '04534a13528b220f19870216163f14512061df393cfe798689ba1ad834f259b7'
            '35d3a8e0809b06051b4b6db6c26bb50fbc5fe495e1437cc922f58065da6e6855')

prepare() {
    cd $srcdir/${_srcname}-${pkgver}/lib/plymouth/themes
    
    mv ubuntu-gnome-logo gnome-logo
    mv ubuntu-gnome-text gnome-text
    
    cd gnome-logo
    mv ubuntu-gnome-logo.grub gnome-logo.grub
    mv ubuntu-gnome-logo.plymouth gnome-logo.plymouth
    mv ubuntu-gnome-logo.script gnome-logo.script
    mv ubuntu_gnome_logo.png gnome_logo.png
    mv ubuntu_gnome_logo16.png gnome_logo16.png
    
    cd ../gnome-text
    mv ubuntu-gnome-text.plymouth.in gnome-text.plymouth.in
    
    cd $srcdir/${_srcname}-${pkgver}
    
    patch -p1 -i "${srcdir}/rename.patch"
}

package() {
    cd $srcdir/${_srcname}-${pkgver}/lib/plymouth/themes/gnome-logo
    mkdir -p $pkgdir/usr/share/plymouth/themes/gnome-logo
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/gnome-logo
    
    cd $srcdir/${_srcname}-${pkgver}/lib/plymouth/themes/gnome-text
    mkdir -p $pkgdir/usr/share/plymouth/themes/gnome-text
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/gnome-text
}
