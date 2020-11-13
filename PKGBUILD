# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: bender02 at archlinux dot us
# Contributor: Troels Kofoed Jacobsen <tkjacobsen at gmail dot com>

pkgname=pam_ssh
pkgver=2.3
pkgrel=3
pkgdesc='PAM module providing single sign-on behavior for SSH.'
arch=('i686' 'x86_64')
url='http://pam-ssh.sourceforge.net/'
license=('custom')
depends=('pam' 'openssl' 'openssh')
options=('!libtool')
source=(
  "fix-common.patch::https://709312.bugs.gentoo.org/attachment.cgi?id=634046"
  "https://sourceforge.net/projects/pam-ssh/files/pam_ssh/$pkgver/pam_ssh-$pkgver.tar.xz"{,.asc}
)
sha512sums=('064036f99f88c142d585b0825bf6c20d10d40fb1ca06ad09be51804fd49cb2dfcbee7633a9ae5237e54b0c9aa20b2ef687fea2fa883e3022b352c78c25fc4d3f'
            'e3ddcf851ffd8f6fb831e2dee7269c1b89283ae2f8f6aa3487bf7b1bc71d26ac9bcbd2a01c5a67a983b980bbb5151e991402940f4752741286d057843c817895'
            'SKIP')
validpgpkeys=(
  '501B088D8485568B87BB62BE180F6A5B3EDE742E'	# Wolfgang Rosenauer
)

prepare () {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/fix-common.patch"
}

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
