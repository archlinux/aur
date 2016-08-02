# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=fedora-wallpapers
pkgver=24
pkgrel=1
pkgdesc="The default Wallpapers for Fedora."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/releases/$pkgver/Everything/source/tree/Packages"
source=("${_rhlink}/f/f21-backgrounds-21.1.0-3.fc24.src.rpm"
		"${_rhlink}/f/f22-backgrounds-22.1.1-1.fc24.src.rpm"
		"${_rhlink}/f/f23-backgrounds-23.1.0-2.fc24.src.rpm"
		"${_rhlink}/f/f24-backgrounds-24.1.2-1.fc24.src.rpm")
md5sums=('1f572cc57a438c493fca16be6e2741db'
         '6032fb55dd008c399b7c0c7164c15504'
         'af68c55c5758be077b584e93cdb3afb2'
         '622cb4fd466d130730e995a88230215c')

prepare()  {
	for x in ./*.tar.xz; do
        tar -xvJf $x
    done
    rm -r ./*.tar.xz
    rm -r ./*.spec
}

build() {
    for x in ./*/; do
        cd $x
        make
        cd ..
    done
}

package() {    
    for x in ./*/; do
        cd $x        
        make install DESTDIR="${pkgdir}"
        cd ..
    done
}


