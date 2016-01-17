# Maintainer: Kanogin Alex <alex at 5252 dot ru>
# Contributor: Aleksey Frolov <atommixz at gmail dotcom>
# Contributor: Orivej Desh <smpuj at bk dotru>

pkgname=openl2tp
pkgver=1.8
pkgrel=6
pkgdesc="L2TP client / server, written by Katalix Systems specifically for Linux"
arch=(i686 x86_64)
url="http://opensource.katalix.com/openl2tp"
license=("GPL")
backup=('etc/conf.d/openl2tpd'
	'etc/ppp/chap-secrets.openl2tp'
	'etc/openl2tpd.conf')
depends=('rpcbind'
	'ppp')
makedepends=('linux-headers')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
		gcc-4.6.patch
		openl2tp.service
		openl2tpd-conf.d
		openl2tpd.conf
		chap-secrets.openl2tp
		example-client.openl2tpd.conf
		example-server.openl2tpd.conf
		example-server.options.openl2tpd
		example-server-radius.openl2tpd.conf
		gentoo-openl2tp-1.8-clientip_as_ipparam.patch
		gentoo-openl2tp-1.8-l2tpconfig.patch
		gentoo-openl2tp-1.8-ldflags.patch
		gentoo-openl2tp-1.8-man.patch
		gentoo-openl2tp-1.8-optionsfile.patch
		gentoo-openl2tp-1.8-parallelbuild.patch
		gentoo-openl2tp-1.8-pppd-2.patch
		gentoo-openl2tp-1.8-setkey.patch
		gentoo-openl2tp-1.8-werror.patch)
options=(!emptydirs)

build() {
	cd "$pkgname-$pkgver"
	
	sed -i -e 's|-Werror||' Makefile
	sed -i -e 's|source|build|' Makefile
	sed -i -e 's|/usr/sbin|/usr/bin|' Makefile
	patch -p2 < ../../gcc-4.6.patch
	
	make
}

package() {
	cd "$pkgname-$pkgver"
	
	make \
	SYS_LIBDIR=/usr/lib \
	DESTDIR=${pkgdir} \
	install
	
	install -Dm644 ../openl2tpd-conf.d "$pkgdir"/etc/conf.d/openl2tpd
	install -Dm644 ../openl2tp.service "$pkgdir"/etc/systemd/system/openl2tp.service
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 ../chap-secrets.openl2tp "$pkgdir"/etc/ppp/chap-secrets.openl2tp
	install -Dm644 ../openl2tpd.conf "$pkgdir"/etc/openl2tpd.conf
}

md5sums=('e3d08dedfb9e6a9a1e24f6766f6dadd0'
         '63e674724d0ae4265b86e776827969e1'
         'bc2d1231a2f1ba2eb05b366b12902edf'
         '38e0f4201f830bd59dabf38dbab6362a'
         '456f1b54f7fb5ec252f1b6e3afdb8bdb'
         'adac6f133fc0179eee15f824b3a98922'
         'dc3a2575cc50804a511d59367599b6e4'
         '78e4804574ca808a2d76b1febe8eed08'
         '4e555341660d3d0339e841496cb3a523'
         'cf6874fdb3f51c91af24b23e2ee91a10'
         '6a331fbbe53bb626dba96ac34a30eaa8'
         '32d617bf5b67bf4c2a49e1506978ae9a'
         '141edbc2b561db0a3ceef18131feadcd'
         '3731bccb386b411686a61177cc09cae4'
         'e20d5f9638e01cedc087690ad259a6d9'
         'e37d2a3ac90892417e9d9ef43feac04a'
         '98022e549a9cfeb1d0ed49a625fb27b8'
         'ecfd33e3996effeca405d1537ef0a501'
         'ba89cd4e86627295d3ee678d29162ee3')
sha1sums=('314a8bb70f9f06bac840200fac0916e80d8d06b3'
          'c6827b31e51514f4c6e2e4a4acd54f20a52d3e96'
          '391e19f89b745a4905d25576a7a4a15b4afb3826'
          'd14fae7f00c09dc1e59b602b44e3d9e7eeb8ae1b'
          '2d1b72244376779df14bb9d893b1309cc2007215'
          '7cb284b5b8b4dc34455e691f9ecfded9c55d5e42'
          '540606a185775d86137faff790bc54b905a297e0'
          'b0c4f5ab3c07856330d26233f96764c15bfe81c3'
          '623226089304af33e871663f02e2ddfa8f5c9f57'
          'bf3df235f895cde5cd0963473c08f5cc4cf2726c'
          '687d561ba6c4494d685d429a8b76f24512d28227'
          'e116771492724db3543e5cfb35bd88b4812aeebe'
          '53cb621f6488f6b96f5c2747629c23e2d43cb3aa'
          '4f1a05616a3f4faf4cc75ff5e2a64e4329cf1d15'
          '1a61d1d06d19f48f1c75aa58acf774c6d5f3175f'
          '3abd6ae04e6e3e5e24950a4becfbdf784767e75c'
          '079569092e1517540af7b13edb3ef1163629784e'
          '2cc3a2f49b6b4d141b22d946d4f229a4e9b2c8c3'
          'c7e36dbe97a8c4fff199cb6a769fa7bb17f6bfc4')

