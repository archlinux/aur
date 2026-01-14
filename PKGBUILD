# Maintainer: Alex Flierl <shad0w73 at freenet dot de>

_gitlab='https://gitlab.alpinelinux.org'
_gitlab_api_path="${_gitlab}/api/v4/projects/1/repository/files/testing%2Fadguardhome%2F"
_commit=3be504af77e6a5c639dc6111a4624d2f40f8991f
pkgname=adguardhome-openrc
pkgver=20250416
pkgrel=1
pkgdesc='OpenRC adguardhome init script'
arch=('any')
url="${_gitlab}/alpine/aports/-/tree/master/testing/adguardhome"
# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/9074
license=('unknown')
depends=('openrc' 'adguardhome')
provides=('init-adguardhome')
conflicts=('init-adguardhome')
backup=('etc/conf.d/adguardhome')
source=("adguardhome.confd::${_gitlab_api_path}adguardhome.confd/raw?ref=${_commit}"
        "adguardhome.initd::${_gitlab_api_path}adguardhome.initd/raw?ref=${_commit}"
        'adguardhome.sysusers'
        'adguardhome.tmpfiles')
sha256sums=('2e8de4fe94c4a98e015ab5087670e3a9d406623ef518c57575c7240ded91540d'
            '004274c6ec39c56a21f24281d550f81288db0669e9ea1a9980423059ceeeaf3b'
            'cb3089f85a0188255e74c6ec21e1a433e9c4e2ea3cc2920f91fbf384dce56b77'
            'd847934161583bd84882c726bd34238524d0f256230fc1f64005e9ec5d699dcb')

package() {
	install -Dm 644 "${srcdir}"/adguardhome.confd "${pkgdir}"/etc/conf.d/adguardhome
	install -Dm 755 "${srcdir}"/adguardhome.initd "${pkgdir}"/etc/init.d/adguardhome
	install -Dm 644 "${srcdir}"/adguardhome.sysusers "${pkgdir}"/usr/lib/sysusers.d/adguardhome.conf
	install -Dm 644 "${srcdir}"/adguardhome.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/adguardhome.conf
}
