# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=lightdm-webkit2-greeter
pkgver=2.2
pkgrel=1
pkgdesc='LightDM greeter that uses WebKit2 for theming via HTML/JavaScript.'
arch=('i686' 'x86_64')
url='https://github.com/antergos/lightdm-webkit2-greeter'
license=('GPL3')
groups=('system')
makedepends=('gobject-introspection' 'meson' 'gettext')
depends=('lightdm' 'webkit2gtk>=2.12' 'accountsservice')
provides=('lightdm-webkit-greeter')
conflicts=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
replaces=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
backup=("etc/lightdm/${pkgname}.conf")
source=("${pkgname}-${pkgver}.zip::https://github.com/Antergos/${pkgname}/archive/${pkgver}.zip")
md5sums=('257a72ef0bac98ce892ef3ca0c2a4634')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	meson --prefix=/usr --libdir=lib ..
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"

	DESTDIR=${pkgdir} ninja install
}

