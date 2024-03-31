# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=nextcloud-inotifyscan-git
_pkgname=nextcloud-inotifyscan
pkgver=r2.9bc30c6
pkgrel=1
pkgdesc="Automatically scan external changes for Nextcloud local storage. "
arch=('any')
url="https://github.com/Blaok/nextcloud-inotifyscan"
license=('MIT')
depends=('python' 'inotify-tools' 'nextcloud')
makedepends=('git')
options=(!emptydirs)
sha256sums=('SKIP')
source=("git+https://github.com/Blaok/nextcloud-inotifyscan.git")
pkgver() {
    cd "${srcdir}/nextcloud-inotifyscan"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}"/usr/bin/
  install -m 755 nextcloud-inotifyscan "${pkgdir}"/usr/bin/
  mkdir -p "${pkgdir}"/usr/lib/systemd/system/
  sed -i 's/local\///'g nextcloud-inotifyscan@.service
	install -m 644 nextcloud-inotifyscan@.service "${pkgdir}"/usr/lib/systemd/system/
	mkdir -p "${pkgdir}"/etc/nextcloud-inotifyscan/
	install -m 644 sample.ini "${pkgdir}"/etc/nextcloud-inotifyscan/

}

# vim:set ts=2 sw=2 et:

