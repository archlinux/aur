# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=adcli
pkgver=0.8.2.r34.g0c02753
pkgrel=1
pkgdesc="Active Directory account management tool"
arch=(i686 x86_64)
url="https://freedesktop.org/software/realmd/"
license=(GPL3)
depends=(krb5 openldap)
makedepends=(docbook-xml docbook-xsl git intltool xmlto)
_commit=0c027538f398b3823bedbfbf5f388ad97784a0ec
source=("git+https://anongit.freedesktop.org/git/realmd/adcli.git#commit=$_commit")
sha256sums=('SKIP')
#source=("https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz"
#        "https://www.freedesktop.org/software/realmd/releases/$pkgname-$pkgver.tar.gz.sig")
#sha256sums=('72f6db406e35d96de2bdc413a5ed69f28a4a735c08670c6556713c3f83921aa4'
#            'SKIP')
validpgpkeys=('C0F67099B808FB063E2C81117BFB1108D92765AF')

pkgver() {
  cd "$pkgname"
  git describe | sed "s/-/.r/; s/-/./"
}

prepare() {
  cd "$pkgname"
  autoreconf -fi
}

build() {
  cd "$pkgname"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       ;
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim: ts=2:sw=2:et
