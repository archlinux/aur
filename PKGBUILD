# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname='persepolis-git'
pkgver=2.2.2_unstable.r21.g3a4e1dd
pkgrel=1
pkgdesc="A graphical front-end for aria2 download manager with lots of features (Github version)."
arch=('any')
url="https://persepolisdm.github.io/"
license=('GPL3')
depends=('aria2' 'vorbis-tools' 'libnotify' 'python' 'python-pyqt5' 'python-requests' 'qt5-svg')
makedepends=('git')
optdepends=('firefox-flashgot: for integrating with firefox')
provides=("${pkgname}" "persepolis")
conflicts=("${pkgname}" "persepolis")
source=("${pkgname}::git+https://github.com/persepolisdm/persepolis.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d ${pkgdir}/usr/{bin,share/{persepolis,pixmaps,applications,licenses/persepolis}}
	install -d ${pkgdir}/usr/share/man/man1
	cp -a ./files/*   ${pkgdir}/usr/share/persepolis
	install -Dm755 ./persepolis ${pkgdir}/usr/bin/persepolis
	install -Dm644 ./Persepolis\ Download\ Manager.desktop ${pkgdir}/usr/share/applications/persepolis.desktop
	install -Dm644 ./persepolis.1.gz ${pkgdir}/usr/share/man/man1/persepolis.1.gz
	cp ./files/icon.svg ${pkgdir}/usr/share/pixmaps/persepolis.svg
	cp ./LICENSE ${pkgdir}/usr/share/licenses/persepolis/
}
