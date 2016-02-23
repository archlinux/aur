# Maintainer: Melvin Vermeeren <mail@mel.vin>
pkgname=owncloud-app-user_otp
pkgver=2.5.1
pkgrel=2
pkgdesc='One Time Password Backend app for ownCloud'
arch=('any')
url='https://github.com/loki36/user-otp'
license=('AGPL3')
depends=('owncloud')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/loki36/user-otp/archive/v2.5.1.tar.gz"
        '0001-OC_Log.patch')
sha256sums=('d2487f0933b8baec87d7d0a5489fa23e4526f122fc19f9a3557423089363fc56'
            '5e15c3162fd109e42cd467c71f136827455268edda0e07960273580a0d7e9535')

prepare() {
	# https://github.com/loki36/user-otp/issues/120
	cd "${srcdir}/user-otp-${pkgver}"
	patch -p1 -i "${srcdir}/0001-OC_Log.patch"
}

package() {
	install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
	cp -a "${srcdir}/user-otp-${pkgver}/user_otp" "${pkgdir}/usr/share/webapps/owncloud/apps/user_otp"
}
