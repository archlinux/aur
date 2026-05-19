# Maintainer: Muhammad Adeel <imadeelshahid at gmail dot com>
# Contributor: Mubashir Haroon <mubashirmusab at gmail dot com>

pkgname=hunspell-ur
pkgver=0.64
pkgrel=4
pkgdesc="Urdu hunspell dictionary (ur_PK, with ur_IN alias)"
arch=('any')
url="https://packages.fedoraproject.org/pkgs/hunspell-ur/hunspell-ur/"
license=('LGPL-2.1-or-later')
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('rpmextract')

# Pinned to a Koji build artifact (not the active mirror) so the URL stays
# valid after this Fedora release is archived. Bump _fcver/_fcrel when a newer
# Fedora build of hunspell-ur is published.
_fcrel=35
_fcver=44
source=("https://kojipkgs.fedoraproject.org/packages/$pkgname/$pkgver/$_fcrel.fc$_fcver/noarch/$pkgname-$pkgver-$_fcrel.fc$_fcver.noarch.rpm")
sha512sums=('04a21f03efe1efd9359fc2e3d996ccddc9373828282131786d04bd3f26814399a431bd8461e5127fdb3272cb2ac1dfd2b512bc669ed89107b25493469ec1234f')

package() {
	rpmextract.sh "$srcdir/$pkgname-$pkgver-$_fcrel.fc$_fcver.noarch.rpm"

	install -Dm644 usr/share/hunspell/ur_PK.aff "$pkgdir/usr/share/hunspell/ur_PK.aff"
	install -Dm644 usr/share/hunspell/ur_PK.dic "$pkgdir/usr/share/hunspell/ur_PK.dic"

	# ur_IN locale alias — same dictionary, just under a second name so apps
	# configured for Indian Urdu also find it.
	ln -s ur_PK.aff "$pkgdir/usr/share/hunspell/ur_IN.aff"
	ln -s ur_PK.dic "$pkgdir/usr/share/hunspell/ur_IN.dic"
}
