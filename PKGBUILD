# Maintainer: Lucas Severo <lucassalves65@gmail.com>

pkgname="holodev-git"
_pkgname="holodev"
pkgver=163.a291ff3
pkgrel=1
epoch=1
pkgdesc="A tool to facilitate the creation of Linux Containers for developing Debian systems"
arch=('i686' 'x86_64')
url="http://joenio.me/desenvolvendo-noosfero-usando-containers-lxc/"
license=('GPL')
depends=('dmidecode' 'bridge-utils' 'libvirt' 'debootstrap' 'lxc' 'dnsmasq' 'ebtables' 'sudo' 'bash-completion')
conflicts=('holodev')
install="$pkgname.install"
source=('holodev::git+http://github.com/lappis-tools/holodev')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname" || exit
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}/debian/holodev.bash-completion" "$pkgdir/etc/bash_completion.d/holodev.bash-completion"
	install -Dm755 "${srcdir}/${_pkgname}/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
