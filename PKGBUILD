# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ephemeral
pkgver=6.4.1
pkgrel=1
pkgdesc="A private-by-default, always-incognito browser for elementary OS."
arch=('x86_64')
url="https://github.com/cassidyjames/ephemeral"
license=('GPL3')
makedepends=('meson' 'vala')
depends=('dconf' 'desktop-file-utils' 'glib2>=2.49.2' 'granite>=5.2.3' 'gtk3>=3.22.29' 'hicolor-icon-theme' 'libdazzle>=3.25.3' 'libgee>=0.8.3' 'libsoup>=2.32.2' 'webkit2gtk>=2.15.4')
conflicts=('ephemeral-bin' 'ephemeral-git')
install=${pkgname}.install
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz"
	"disable_paid_and_native_infobars.patch")
sha512sums=('c132224c7a40f1623716c48eabaecf530a99f4eae4352f0b36b24f6420c181f8afda99703a8fa84398c132867efafe0a680a5f8add4695fda5d34c14b4060bf1'
            'f02f2a25b9acffc52df02322813d0536ea823fdc5deec234b4e49e9441054421d8c2621911b64acf78cc2e6f156d6193e8b100b780e76fd4e0e7b554e1c83b16')

#prepare() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
##	Disable InfoBar warnings for donation recommendation and app not running on ElementaryOS.
#	patch -Np1 < ../../disable_paid_and_native_infobars.patch
#}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson build --prefix=/usr
	ninja -C build
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	DESTDIR="$pkgdir" ninja -C build install
}
