# Maintainer: alex

pkgname=freeplane-srcbuild
pkgnamerl=freeplane
pkgver=1.3.15
pkgrel=1
pkgdesc="A free mindmapping and knowledge management tool"
arch=('i686' 'x86_64')
url="http://freeplane.sourceforge.net"
license=('GPL2')
makedepends=('apache-ant')
depends=('java-runtime' 'bash' 'libxtst')
conflicts=('freeplane' 'freeplane-beta' 'freeplane-bzr')
source=(http://downloads.sourceforge.net/sourceforge/freeplane/freeplane_src-${pkgver}.tar.gz 'freeplane.desktop' 'freeplane.run')
sha256sums=('ad7a31c1cb81759c0af0a41f14302c3f58963292db33eca4dc60eeeaac57f4fc'
            'a1c7e9b276c9566fcb806322b6e3ad8e6ce66718d788b42a1063683e39f9de4c'
            'e7b7d4e0fddce2af3909a1ebbd18928bcc917a809fe460c140978e7b0530387c')




#build() {

#    cd $srcdir

#    if [[ -d $_bzrmod ]]; then
#	cd $_bzrmod
#	bzr pull $_bzrtrunk -r $pkgver
#    else
#	bzr branch $_bzrtrunk $_bzrmod -r $pkgver
#    fi

#    cd $srcdir/$_bzrmod
#    /usr/share/java/apache-ant/bin/ant -q clean build
#}

package() {

cd "${srcdir}/${pkgnamerl}-${pkgver}"
mkdir -p $pkgdir/usr/share
/usr/bin/ant -Dbuild="$pkgdir/usr/share/${pkgnamerl}" build
    #mkdir -p $pkgdir/usr/share
    #cp -r $srcdir/freeplane-${pkgver} $pkgdir/usr/share/$pkgname

    cd "$pkgdir/usr/share/$pkgnamerl"
    rm *.exe *.bat

    mkdir -p "$pkgdir"/usr/bin

    install -Dm755 "$srcdir"/freeplane.run "$pkgdir"/usr/bin/freeplane
    install -Dm644 "$srcdir"/freeplane.desktop "$pkgdir"/usr/share/applications/freeplane.desktop
    
    install -Dm644 "$pkgdir"/usr/share/"$pkgnamerl"/freeplane.svg "$pkgdir"/usr/share/pixmaps/freeplane.svg
    install -Dm644 "$pkgdir"/usr/share/"$pkgnamerl"/freeplane.png "$pkgdir"/usr/share/pixmaps/freeplane.png
}
