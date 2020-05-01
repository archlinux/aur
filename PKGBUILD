# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=post-factum
_reponame=uksmd
_rev=2f771b79da8aaedc2c3a95ee3cc968ae034809a0
pkgver=0.0.0.r4.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(procps-ng libcap-ng)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_repouser}/${_reponame}/-/archive/${_rev}/${_reponame}-${_rev}.tar.gz)
sha256sums=('d0d4a60af8207b37dd01fce9a70fe67498dadded25266abc0b8830aad954e7d3')

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

