# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=alpine
pkgver=2.23
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Apache licensed PINE mail user agent."
url="http://alpine.x10host.com/"
license=('APACHE')
depends=('gettext' 'krb5' 'libldap' 'pam')
optdepends=('aspell: for spell-checking support'
			'hunspell: for spell-checking support'
			'topal: glue program that links GnuPG and alpine')
provides=('pine' 're-alpine')
conflicts=('pine' 're-alpine')
replaces=('pine' 're-alpine')
options=("!makeflags")
source=("http://alpine.x10host.com/alpine/release/src/alpine-2.23.tar.xz")
md5sums=('2ea4e6612c503ae3bdced2b6e4364d48')

build() {
	cd "${pkgname}-${pkgver}"

	# Configure Alpine
	LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr \
	--with-passfile=.alpine.passfile --without-tcl --disable-shared \
	--with-system-pinerc=/etc/${pkgname}.d/pine.conf \
	--with-system-fixed-pinerc=/etc/${pkgname}.d/pine.conf.fixed

	# Build Alpine
	make
}

package() {
	cd "${pkgname}-${pkgver}"

	# Install Alpine
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
