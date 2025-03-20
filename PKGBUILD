# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/wacom-utility

pkgname=wacom-utility
pkgver=1.21
_uprel=3
pkgrel=10
pkgdesc='Graphical Wacom tablet configuration utility. (Does not work for newer wacom tablets; latest update was in 2011.)'
arch=(any)
url='https://www.linux-apps.com/content/show.php/Wacom+Control+Panel?content=104309'
license=(GPL-2.0-or-later)
depends=(bash
         gksu
         gtk2
         pygtk
         python2
         python2-cairo
         python2-gobject2
         xf86-input-wacom)
source=("http://ppa.launchpad.net/hughescih/ppa/ubuntu/pool/main/w/${pkgname}/${pkgname}_${pkgver}-${_uprel}.tar.gz"
        wacom-utility.sh
        wacom-utility.desktop)
sha256sums=('91b8e7e658071e67f3fb0b684ae815138789e810fb5c423b98f6ed550dbea972'
            'd3afc5467da4f588211e6241ffceeb851199f5a71cd157c8016e7e3d14974e34'
            'c6235b40e55aa7266d7bc47a2f11bcef98c3bb30c4d80223ee910c6b461bebc2')

package() {
	cd "$pkgname"
	install -Dm0755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	find \( -regex '.*\.\(py\|png\|xml\|glade\)' -or -name 'keymap.txt' \) \
		-exec install -D {} "$pkgdir/usr/share/$pkgname/{}" \;
}
