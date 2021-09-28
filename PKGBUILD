# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd
_repouser=post-factum
_reponame=uksmd
_rev=4635f7dae065b96dc3708afc8191eaa6ae8620ed
pkgver=0.0.0.r6.${_rev:0:10}
pkgrel=1
pkgdesc="Userspace KSM helper daemon"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN procps-ng libcap-ng)
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_repouser}/${_reponame}/-/archive/${_rev}/${_reponame}-${_rev}.tar.gz)
sha256sums=('edcfbcf7692ee74b09c75b17b5c0558735d02e6977aee585be0a29c04476d36f')

build() {
	cd "${_reponame}-${_rev}"

	make
}

package() {
	cd "${_reponame}-${_rev}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dt "${pkgdir}"/usr/lib/systemd/system -m0644 distro/${pkgname}.service
}

