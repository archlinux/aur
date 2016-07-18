# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail.com>

pkgname='persepolis-git'
pkgver=v2.0.1_unstable.r1.gbe3657e
pkgrel=1
pkgdesc="A graphical front-end for aria2 download manager with lots of features."
arch=('any')
url="https://github.com/alireza-amirsamimi/persepolis"
license=('GPL3')
depends=('aria2' 'vorbis-tools' 'libnotify' 'python' 'python-pyqt5')
makedepends=('git')
optdepends=('firefox-flashgot: for integrating with firefox')
provides=("${pkgname}" "persepolis")
conflicts=("${pkgname}" "persepolis")
source=("${pkgname}::git+https://github.com/alireza-amirsamimi/persepolis.git")
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
	install -d ${pkgdir}/usr/{bin,share/{persepolis,applications,pixmaps,licenses/persepolis}}
	cp -a ./files/*   ${pkgdir}/usr/share/persepolis
	install -Dm755 ./persepolis ${pkgdir}/usr/bin/persepolis
	install -Dm644 ./Persepolis\ Download\ Manager.desktop ${pkgdir}/usr/share/applications/persepolis.desktop
	cp ./files/icon.png ${pkgdir}/usr/share/pixmaps/persepolis.png
	cp ./LICENSE ${pkgdir}/usr/share/licenses/persepolis/
}
