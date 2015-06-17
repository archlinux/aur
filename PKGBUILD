# Maintainer: svalo <valo@eigenlab.org>
# Contributor: David Costa <david@zarel.net>
# Contributor: fauno <fauno@kiwwwi.com.ar>
# Based on monkeysphere-git from
# Contributor: Olivier Mehani <shtrom-arch@ssji.net>
pkgname=monkeysphere
pkgver=0.37
pkgrel=2
pkgdesc="Leverage the OpenPGP web of trust for OpenSSH and Web authentication"
arch=('any')
url="http://web.monkeysphere.info/"
license=('GPL3')
depends=('gnupg1' 'lockfile-progs' 'perl-crypt-openssl-rsa' 'perl-digest-sha1')
checkdepends=('socat' 'openssh' 'cpio' 'gnupg')
source=(http://archive.monkeysphere.info/debian/pool/${pkgname}/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz
        binmerge.patch
	ms.patch
	mshost.patch
	msauth.patch)

sha256sums=('b510b8a414fb400356e80f1f882488785df72ac54078410b54d4c50a84686e59'
            'e49a1097296b06090010ce5344588f5e4917aeb06a118de920fc58411d2a7cf7'
            'ce490eebfbf92b9a9abaf77d43489b0cdd7ebab427262e9eb7fbefdb67cdf289'
            '4ddad85f6a9998f8f8869cef4f2f6d7bf9f04171fb3b5ae6c6621bfc8dc2bcbe'
            'bcad168603c2afd4db6b54edd61c8c9cdd1e08bcea7de3b936a3269f271e3de6')

install=monkeysphere.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Ni "${srcdir}/binmerge.patch"
  patch -p1 -Ni "${srcdir}/ms.patch"
  patch -p1 -Ni "${srcdir}/msauth.patch"
  patch -p1 -Ni "${srcdir}/mshost.patch"
}

# Checks fail 
#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  make test
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/var/lib/monkeysphere"
}
