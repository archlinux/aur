# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: hobbypunk <hoppe.marcel at gmail dot com>

pkgname=plymouth-theme-gnome-logo
_srcname=ubuntu-gnome-default-settings
pkgver=17.10.1
pkgrel=1
pkgdesc="GNOME plymouth theme based on Ubuntu-gnome plymouth theme."
arch=('any')
url="http://packages.ubuntu.com/artful/plymouth-theme-ubuntu-gnome-logo"
license=('GPL')
depends=('plymouth')
install='plymouth-theme-gnome-logo.install'
source=("http://archive.ubuntu.com/ubuntu/pool/universe/u/${_srcname}/${_srcname}_${pkgver}.tar.xz"
	'gnome_logo.png'
	'gnome.patch')
sha256sums=('8f3096173318ce7b94fb5f204238c7c67da2abb0e8863ec290d0f6b3c26d725e'
            '408170cb37475e95ab47bcf7b0c69a89d7246308c19627e0f5f978888fa083aa'
            '6c8d5f08a0a8d0e5bc90e2ef04e073770ba9e80cadd18ddc11041a347320cdab')

prepare() {
    cd $srcdir/${_srcname}-${pkgver}/usr/share/plymouth
    patch -p2 -i "${srcdir}/gnome.patch"
	
    cd $srcdir/${_srcname}-${pkgver}/usr/share/plymouth/themes    
    mv ubuntu-gnome-logo gnome-logo
    mv ubuntu-gnome-text gnome-text
    
    cd gnome-logo
    mv ubuntu-gnome-logo.grub gnome-logo.grub
    mv ubuntu-gnome-logo.plymouth gnome-logo.plymouth
    mv ubuntu-gnome-logo.script gnome-logo.script
    mv ubuntu_gnome_logo.png gnome_logo.png
    cp "${srcdir}/gnome_logo.png" gnome_logo.png
    
    cd ../gnome-text
    mv ubuntu-gnome-text.plymouth.in gnome-text.plymouth.in    
}

package() {
    cd $srcdir/${_srcname}-${pkgver}/usr/share/plymouth/themes/gnome-logo
    mkdir -p $pkgdir/usr/share/plymouth/themes/gnome-logo
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/gnome-logo
    
    cd $srcdir/${_srcname}-${pkgver}/usr/share/plymouth/themes/gnome-text
    mkdir -p $pkgdir/usr/share/plymouth/themes/gnome-text
    install -Dm644 * "${pkgdir}"/usr/share/plymouth/themes/gnome-text
}
