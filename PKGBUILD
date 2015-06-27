# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=instantclient-sqlplus
pkgname=oracle-${_pkgname}
pkgver=12.1.0.2.0
pkgrel=2
pkgdesc="SQL*Plus for Oracle Instant Client"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=(oracle-instantclient-basic=$pkgver)
replaces=('instantclient-sqlplus')
options=(!strip)

# Fail if retrieval is attempted of any of the manual:// URLs
DLAGENTS+=('manual::/usr/bin/false');

# These are the only files we want to include in the source package
source=(LICENSE)
md5sums=('2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')

# Add the main file, depending on which architecture we're building for
case "$CARCH" in
	i686)
		source[1]="manual://${_pkgname}-linux-$pkgver.zip"
		md5sums[1]='95e31bfb4b7fee73134e726fe168de04'
		sha256sums[1]='03062efdb88423342657a679760581af14d936a897647bddcf248453bb01105f'
		;;
	x86_64)
		source[1]="manual://${_pkgname}-linux.x64-$pkgver.zip"
		md5sums[1]='f165280723ff1c96f825ba62c63b65cf'
		sha256sums[1]='b52a7fca7279d4e9584674ea6f24464411f62f6ba95a2a16ec92979e99cac4bd'
		;;
esac

msg "Warning: This software cannot be downloaded automatically."
plain "You will need to sign up for an Oracle account and download the software from"
plain "Oracle directly.  Place the downloaded file in the same directory as the"
plain "PKGBUILD and re-run makepkg."
plain ""
plain "The source .zip files can be downloaded from:"
plain ""
plain "i686   - http://www.oracle.com/technetwork/topics/linuxsoft-082809.html"
plain "x86_64 - http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html"
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
	local basedir="$srcdir/instantclient_12_1"
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/lib"
	install -m 755 -t "$pkgdir/usr/bin" "$basedir/sqlplus"
	install -m 755 -t "$pkgdir/usr/lib" "$basedir/"*.so
	install -m 644 -t "$pkgdir/usr/lib" "$basedir/"*.sql
}
