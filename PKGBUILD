# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=polkit-explorer
_pkgname=Polkit-Explorer-master
pkgver=1
pkgrel=6

pkgdesc="Present PolicyKit information in a human-readable form."
arch=('any')
url="https://github.com/scarygliders/Polkit-Explorer"
license=('ISC')

depends=('python2-pyqt4' 'python2-lxml')
source=('https://github.com/scarygliders/Polkit-Explorer/archive/master.zip'
	'polkit-explorer.desktop')
sha256sums=('877b909d2f85d7c5c448b75a15fc193b1c18882f4548bbd9dbce3805803ae751'
            '4343e7c3c9e0dc03bfae8521ab4197661c6ddf4caf150ba4cf3369dc9550518a')

prepare() {
    sed -i 's/python$/python2/' "$_pkgname"/polkitex.py
}

package() {
    cd "$_pkgname"
    pydir=usr/lib/python2.7/site-packages/polkitex
    
    install -Dm755 polkitex.py "$pkgdir/$pydir"/polkitex.py
    install -dm755 "$pkgdir"/usr/bin
    ln -s /"$pydir"/polkitex.py "$pkgdir"/usr/bin/polkitex
    
    for i in Ui_*.py; do
	install -Dm644 "$i" "$pkgdir/$pydir/$i"
    done
    
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/polkit-explorer/LICENSE
    install -Dm644 "$srcdir"/polkit-explorer.desktop \
	    "$pkgdir"/usr/share/applications/polkit-explorer.desktop
}
