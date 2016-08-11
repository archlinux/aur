# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=fedora-wallpapers
pkgver=24
pkgrel=2
pkgdesc="The default Wallpapers for Fedora, from fedora 11 (Leonidas) to fedora 24."
arch=("i686" "x86_64")
url="https://fedoraproject.org/wiki/Wallpapers"
license=("CC-BY-SA")
_rhlink="https://archives.fedoraproject.org/pub/fedora/linux/releases/$pkgver/Everything/source/tree/Packages"
source=("${_rhlink}/l/leonidas-backgrounds-11.0.0-11.fc24.src.rpm"
		"${_rhlink}/c/constantine-backgrounds-12.1.1-11.fc24.src.rpm"
		"${_rhlink}/g/goddard-backgrounds-13.0.0-10.fc24.src.rpm"
		"${_rhlink}/l/laughlin-backgrounds-14.1.0-12.fc24.src.rpm"
		"${_rhlink}/l/lovelock-backgrounds-14.91.1-10.fc24.src.rpm"
		"${_rhlink}/v/verne-backgrounds-15.92.1-10.fc24.src.rpm"
		"${_rhlink}/b/beefy-miracle-backgrounds-16.91.0-9.fc24.src.rpm"
		"${_rhlink}/s/spherical-cow-backgrounds-18.0.0-6.fc24.src.rpm"
		"${_rhlink}/s/schroedinger-cat-backgrounds-18.91.0-5.fc24.src.rpm"
		"${_rhlink}/h/heisenbug-backgrounds-20.0.0-4.fc24.src.rpm"
		"${_rhlink}/f/f21-backgrounds-21.1.0-3.fc24.src.rpm"
		"${_rhlink}/f/f22-backgrounds-22.1.1-1.fc24.src.rpm"
		"${_rhlink}/f/f23-backgrounds-23.1.0-2.fc24.src.rpm"
		"${_rhlink}/f/f24-backgrounds-24.1.2-1.fc24.src.rpm")
md5sums=('41aedb6a123feb422d6dcf3b18a87ef1'
         '069be42443cc2fc67c3d2fa09ede7052'
         'a501925ac23c2acec3fd2de47baf5395'
         'f5b2aaf7c58ba2d9c3c701f0a3140459'
         'd49cde187438db73a8ce58a11e1746e3'
         'd1c6a7f1440fc7405e289ea15a0ae993'
         '34eeb7c1f8f751a7344a69ea376b6465'
         'bf546968992c22b0309917fa2c51c06b'
         '2f58e847f93dd64188b2414f714f6919'
         '357e1b743b2493e92ed8cc3ba3ece63f'
         '1f572cc57a438c493fca16be6e2741db'
         '6032fb55dd008c399b7c0c7164c15504'
         'af68c55c5758be077b584e93cdb3afb2'
         '622cb4fd466d130730e995a88230215c')

prepare()  {
	for x in ./*.tar.xz; do
        tar -xvJf $x
    done
    for x in ./*.tar.lzma; do
        tar -xv --lzma -f $x
    done
    rm -r ./*.tar.xz
    rm -r ./*.tar.lzma
    rm -r ./*.spec
}

build() {
    for x in ./*/; do
        cd $x
        [[ -f ./Makefile ]] && make
        cd ..
    done
}

package() {    
    for x in ./*/; do
        cd $x        
        [[ -f ./Makefile ]] && make install DESTDIR="${pkgdir}"
        cd ..
    done
    
    mkdir ${pkgdir}/usr/share/backgrounds/leonidas
    cp -a ./leonidas-backgrounds-*/{landscape,lion,leonidas*.xml} ${pkgdir}/usr/share/backgrounds/leonidas/
    cp -a ./leonidas-backgrounds-*/desktop-backgrounds-*.xml ${pkgdir}/usr/share/gnome-background-properties/
}
