# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=post-factum
_reponame=uksmd
_rev=e1d4b12d22fd710f0155d75585940f0d439f1544
pkgver=0.0.0.r11.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN procps-ng libcap-ng)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_repouser}/${_reponame}/-/archive/${_rev}/${_reponame}-${_rev}.tar.gz)
sha256sums=('da2ad62bbafbaa66396c20a5a657ba6be5dec37eb4f25260a3060f860465accc')

build() {
	cd "${_reponame}-${_rev}"

	make
}

package() {
	cd "${_reponame}-${_rev}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dt "${pkgdir}"/usr/lib/systemd/system -m0644 distro/${pkgname}.service
}

