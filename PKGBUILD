# Maintainer: Alexandr Boiko <4le34n at gmail dot com>

pkgname=ptokax
_pkgname=PtokaX
pkgver=0.5.2.1
pkgrel=3
pkgdesc="PtokaX Direct Connect Hub is a multi-platform server application for Neo-Modus Direct Connect Peer-To-Peer sharing network."
arch=('x86_64')
url="http://www.PtokaX.org"
license=('GPL')
depends=('lua' 'tinyxml' 'zlib')
makedepends=('make' 'gcc')
optdepends=('postgresql-libs'
            'sqlite'
            'mariadb')
install=install
changelog=
source=("$url/files/$pkgver-nix-src.tgz"
        'service'
        'tmpfiles.d'
        'Settings.pxt')

build() {
	cd "$_pkgname"
    # Compile PtokaX without database support
	make fedora
    
    # Compile PtokaX with PostgreSQL database support
    #make -f makefile-postgres fedora
     
    # Compile PtokaX with MariaDB database support
    #make -f makefile-mysql fedora
    
    # Compile PtokaX with SQLite database support
    #make -f makefile-sqlite fedora

}

package() {
	cd "$_pkgname"
    install -dm0755 "$pkgdir/var/lib/$pkgname/cfg"
    install -Dm0755 PtokaX "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm0644 "$srcdir"/Settings.pxt "$pkgdir/var/lib/$pkgname/cfg/Settings.pxt"
    install -Dm0644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 Changelog.txt "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm0644 ReadMe.txt "$pkgdir/usr/share/doc/$pkgname/README"
}

md5sums=('3f8364d3d36f6f67652cc14c855004e7'
         'fa9ba9566428af9603297aea1343ced2'
         '6a20c3ddfb3c625cca55f7480e609e1e'
         '25b7201edc7c31fd6b14a0d61ee0e1cc')
