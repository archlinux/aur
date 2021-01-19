# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=instantclient-jdbc
pkgname=oracle-${_pkgname}
pkgver=21.1.0.0.0
_urlver=211000
_unzippath=instantclient_21_1
pkgrel=1
pkgdesc="Additional support for XA, Internationalization, and RowSet operations under JDBC"
arch=('x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=(oracle-instantclient-basic=$pkgver)
replaces=('instantclient-jdbc')
options=(!strip)

# Fail if retrieval is attempted of any of the manual:// URLs
DLAGENTS+=('manual::/usr/bin/false');

# These are the only files we want to include in the source package
source=(LICENSE
        "https://download.oracle.com/otn_software/linux/instantclient/${_urlver}/${_pkgname}-linux.x64-${pkgver}.zip")
md5sums=('2d62e22e4f2d7e6d220fafde0f692a7d'
         'c0242c683b990dc199d18502be771ca5')
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2'
            '76c866272712f2b432cc4be675605b22deca02f7a88a292b5ed8d29212d79dc7')

plain "If you run into any problems downloading the files, get the .zip version from"
plain "Oracle and place them in the PKGBUILD directory then re-run makepkg:"
plain ""
plain "  https://www.oracle.com/database/technologies/instant-client/linux-x86-64-downloads.html"
plain ""
plain "Alternatively, unofficial prebuilt Arch packages are available by adding the"
plain "following lines to /etc/pacman.conf, if you agree to the Oracle licence[1]:"
plain ""
plain "  [oracle]"
plain "  SigLevel = Optional TrustAll"
plain '  Server = http://linux.shikadi.net/arch/$repo/$arch/'
plain ""
plain "Then run 'pacman -Sys oracle' to see available packages."
plain ""
plain "[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
plain ""

package() {
	local basedir="$srcdir/${_unzippath}"
	install -d "$pkgdir/usr/lib"
	install -m 755 -t "$pkgdir/usr/lib" "$basedir/"*.so
	install -m 644 -t "$pkgdir/usr/lib" "$basedir/"*.jar
}
