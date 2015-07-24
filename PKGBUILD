# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>

pkgname=polkit-explorer
pkgver=1
pkgrel=7

pkgdesc="Present PolicyKit information in a human-readable form."
url="https://github.com/scarygliders/Polkit-Explorer"
license=('ISC')
arch=('any')

depends=('python2-pyqt4' 'python2-lxml')
source=("https://github.com/scarygliders/Polkit-Explorer/archive/master.zip"
	'polkit-explorer.desktop')
sha256sums=('bc90ca03ee4d216bfb5e415d625c1449af5c87898f98305b48b10adf730c75d6'
            '4343e7c3c9e0dc03bfae8521ab4197661c6ddf4caf150ba4cf3369dc9550518a')

package() {
  cd Polkit-Explorer-master
  local pydir=usr/lib/python2.7/site-packages/polkitex
  sed -i 's/python$/python2/' polkitex.py
  
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
