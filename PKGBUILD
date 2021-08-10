# Maintainer:
pkgname=scrt-sfx-opt-bin
pkgver=9.0.2
pkgrel=2496
pkgdesc='SecureCRT + SecureFX 9.0 Bundle'
arch=('x86_64')
url='https://www.vandyke.com/'
license=('custom:VanDyke')
depends=('glibc' 'openssl' 'qt5-base' 'icu66')
provides=('SecureCRT' 'SecureFX')
install=${pkgname}-${pkgver}-${pkgrel}.install

_bundle_name=scrt-sfx
_tarball_base_name=${_bundle_name}-${pkgver}.${pkgrel}.ubuntu20-64
_tarball_name=${_tarball_base_name}.tar.gz
_ld_so_conf_name=${pkgname}-${pkgver}-${pkgrel}.conf

source=(
	"file://${_tarball_name}"
	"${_ld_so_conf_name}"
	"${install}"
)

sha512sums=(
	"62e3ec59da19c995c785ba839f6a26d96b848efcf251c4fe92976be6503271eff5082e16b78de3b6c8f9598990ed8efe2ec6ddb5ae200f15b4e1774d143b7ac4"
	"acba6c070605e0317413a2c4f27416e3ddf85da26307299e97fffe1180e330fb25eddf4e113fbeb939e455950d029fe81974d59ab831aae0f4f6a72265e05afc"
	"032cc0b7471638f6fa89c95fcc23284f72f8774c1532d21cd830cc1b5e125b988216fdc85965b755fb8e0f62664d6b41af1453227e6c9a79644ea6a5bc9586cd"
)

package() {
	stage_dir=${pkgdir}/opt/${pkgname}/${_tarball_base_name}

	install -dm755 "${stage_dir}"
	# install -Dm644 "${_ld_so_conf_name}" "${pkgdir}/etc/ld.so.conf.d/${_ld_so_conf_name}"
	cp -R "${srcdir}"/${_bundle_name}-${pkgver}/* "${stage_dir}"

	ln -s /usr/lib/qt/plugins/platforms "${pkgdir}/opt/${pkgname}/${_tarball_base_name}"
}
