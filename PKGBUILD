# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: bender02 at archlinux dot us
# Contributor: Troels Kofoed Jacobsen <tkjacobsen at gmail dot com>

pkgname=pam_ssh
pkgver=2.1
pkgrel=2
pkgdesc='PAM module providing single sign-on behavior for SSH.'
arch=('i686' 'x86_64')
url='http://pam-ssh.sourceforge.net/'
license=('custom')
depends=('pam' 'openssl' 'openssh')
options=('!libtool')
install=pam_ssh.install
source=("http://downloads.sf.net/sourceforge/pam-ssh/$pkgname-$pkgver.tar.xz"{,.asc} "$pkgname.install")
sha512sums=('8252b15efffa5687f740963f7a3c3479b73f99eca26a17155f915a10b9a71362a2778449adf10f01c174cc8545961ce3ea64459338a7c995c242b209529fd640'
            'SKIP'
            '954f203926e1c559d6a1471cf8b547373673e7ae4bf00b936a3014f38f1f92a035ba2843e3340d7237e5bed7550d9a3dee99f57cd1d01e1697fc12b6ae6ae58b')
validpgpkeys=('501B088D8485568B87BB62BE180F6A5B3EDE742E') # Wolfgang Rosenauer

build () {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-pam-dir=/usr/lib/security
	make
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -m 644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
