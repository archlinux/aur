# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=ptokax
_pkgname=PtokaX
pkgver=0.5.2.1
pkgrel=1
pkgdesc="PtokaX Direct Connect Hub is a multi-platform server application for Neo-Modus Direct Connect Peer-To-Peer sharing network."
arch=('x86_64')
url="http://www.PtokaX.org"
license=('GPL')
depends=('lua' 'tinyxml' 'zlib')
makedepends=('make' 'gcc')
optdepends=('percona-server')
install=install
changelog=
source=("http://www.PtokaX.org/files/$pkgver-nix-src.tgz"
        'service'
        'tmpfiles.d')

build() {
	cd "$_pkgname"
	make fedora
}

package() {
	cd "$_pkgname"
    install -dm0755 "$pkgdir/var/lib/$pkgname"
    install -Dm0755 PtokaX "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm0644 "$srcdir/tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm0644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 Changelog.txt "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
    install -Dm0644 ReadMe.txt "$pkgdir/usr/share/doc/$pkgname/README"
}

md5sums=('3f8364d3d36f6f67652cc14c855004e7'
         'b2aeae9082972813df7223ea068efb48'
         '6a20c3ddfb3c625cca55f7480e609e1e')
