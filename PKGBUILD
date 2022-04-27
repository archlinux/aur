# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/uksmd by
# Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=uksmd-git
_repouser=post-factum
_reponame=uksmd
pkgver=0.0.0.r29.e1d4b12
pkgrel=1
pkgdesc="Userspace KSM helper daemon (git version)"
url="https://gitlab.com/post-factum/uksmd"
license=(GPL3)
arch=(x86_64)
depends=(UKSMD-BUILTIN procps-ng libcap-ng)
makedepends=(git)
source=(${_reponame}::git+${url}.git)
sha256sums=('SKIP')
conflicts=("${_reponame}")
provides=("${_reponame}")

pkgver() {
  cd "${_reponame}"
  printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_reponame}"

	make
}

package() {
	cd "${_reponame}"

	make DESTDIR="${pkgdir}" PREFIX="/usr" install

	install -Dt "${pkgdir}"/usr/lib/systemd/system -m0644 distro/${_reponame}.service
}
