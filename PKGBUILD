# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Juraj Fiala <doctorjellyface at riseup dot net>
# Contributor: hobbypunk <hoppe.marcel at gmail dot com>

pkgname=plymouth-theme-gnome-logo
_srcname=ubuntu-gnome-default-settings
pkgver=16.10.1
pkgrel=2
pkgdesc="GNOME plymouth theme based on Ubuntu-gnome plymouth theme."
arch=('any')
url="http://packages.ubuntu.com/yakkety/plymouth-theme-ubuntu-gnome-logo"
license=('GPL')
depends=('plymouth')
install='plymouth-theme-gnome-logo.install'
source=("http://archive.ubuntu.com/ubuntu/pool/universe/u/${_srcname}/${_srcname}_${pkgver}.tar.xz"
		'gnome_logo.png'
		'gnome.patch')
md5sums=('0b39e1accc0bcf2ede4e9ca42e00b860'
         '91f82e0f9baa432f621574425193047e'
         'fe3398ef0a9f9eb0de25a6e664523bd4')

prepare() {
	cd $srcdir/${_srcname}-${pkgver}
	patch -p1 -i "${srcdir}/gnome.patch"
	
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
