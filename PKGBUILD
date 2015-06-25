# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=tsocks-ipv6
pkgver=1.8beta6
GIT_COMMIT=be36c83a7326c75123fa019a4cb53792ecd8f689
pkgrel=1
pkgdesc='Transparent SOCKS proxying library, with IPv6 support'
url='https://github.com/Elysion-tcfa/tsocks'
license=('GPL')
arch=('i686' 'x86_64')
source=("https://github.com/Elysion-tcfa/tsocks/archive/${GIT_COMMIT}.tar.gz"
  "fix-mkinstalldirs.patch")
md5sums=('170e2115c29544b9ffd553dd78f63d6b'
         'b85f664abe7e6afdb908c94fbfd17602')
sha1sums=('52625a176ed9e7beb76d8666e88122da538156ac'
          'cf226b90eca8d3cc69cf4016c4f3ab2c0a88de57')
sha256sums=('76c4ac3cde166b3b84653e6788203bdcea2a313edb13c7aefaf9c69a64c76ea8'
            '0fcdd40b820b9ee2da2625f80ed5badd4326825a1cc89dc9596f202e405a0699')
conflicts=("tsocks")


build() {
	cd "${srcdir}/tsocks-${GIT_COMMIT}"
	export CPPFLAGS=
        patch -p1 < ../fix-mkinstalldirs.patch
	./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --libdir=/usr/lib
	make
}

package() {
	cd "${srcdir}/tsocks-${GIT_COMMIT}"
	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/${pkgname}"
	install -m644 tsocks.conf.{simple,complex}.example "${pkgdir}/usr/share/${pkgname}"
}
