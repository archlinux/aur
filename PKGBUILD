# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=post-factum
_reponame=uksmd
_rev=9b6a6e55e07c524ba0a36eb25c869b47655010ee
pkgver=0.0.0.r3.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(procps-ng)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_repouser}/${_reponame}/-/archive/${_rev}/${_reponame}-${_rev}.tar.gz)
sha256sums=('529df9a94731ccb913dc4679bd93205efbd2299b9d041a756bf567601e394844')

build() {
	cd "${_reponame}-${_rev}"

	make
}

package() {
	cd "${_reponame}-${_rev}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "distro/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

