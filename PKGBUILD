# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=post-factum
_reponame=uksmd
_rev=b6af35cb9a772f643fd1bd703f4d1f6c6c6d3b79
pkgver=0.0.0.r5.${_rev:0:10}
pkgrel=2
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN procps-ng libcap-ng)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_repouser}/${_reponame}/-/archive/${_rev}/${_reponame}-${_rev}.tar.gz)
sha256sums=('434d34035ee2032668f9393e39af5a2fdc34dd0ff90b742d8e1d3af8df433198')

build() {
	cd "${_reponame}-${_rev}"

	make
}

package() {
	cd "${_reponame}-${_rev}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dt "${pkgdir}"/usr/lib/systemd/system -m0644 distro/${pkgname}.service
}

