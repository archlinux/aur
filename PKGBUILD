# Maintainer: Felix Singer

pkgname=firefox-hardening
pkgver=r64.27255a6
pkgrel=1
arch=('any')
pkgdesc="Firefox hardening stuff"
license=('GPLv3')
makedepends=('git')
optdepends=('firefox')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
install=firefox-hardening.install
url="https://github.com/ntzwrk/${pkgname}"
source=("git+https://github.com/ntzwrk/${pkgname}.git")
sha512sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m755 -D "${srcdir}/${pkgname}/beatthedeviloutofit.sh" "${pkgdir}/usr/lib/${pkgname}/beatthedeviloutofit.sh"
	install -m644 -D "${srcdir}/${pkgname}/ffh.conf.example" "${pkgdir}/usr/lib/${pkgname}/ffh.conf.example"
	install -m644 -D "${srcdir}/${pkgname}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"

	cp -r ${srcdir}/${pkgname}/prefs ${pkgdir}/usr/lib/${pkgname}/
	chmod 755 ${pkgdir}/usr/lib/${pkgname}/prefs
	chmod 644 ${pkgdir}/usr/lib/${pkgname}/prefs/*
}
