# Maintainer: timescam <timescam at duck dot com>

pkgname=papirus-folders-doas-git
_pkgname=papirus-folders
pkgver=1.11.0.0.g83a2225
pkgrel=1
pkgdesc="Allows to change the color of folders (git version) w/ doas patch"
url="https://github.com/PapirusDevelopmentTeam/papirus-folders"
arch=("any")
license=("MIT")
depends=("papirus-icon-theme" "opendoas")
makedepends=("git")
provides=("papirus-folders")
conflicts=("papirus-folders")
options=("!strip")
source=("${_pkgname}::git+https://github.com/PapirusDevelopmentTeam/${_pkgname}.git"
        "papirus-folders.hook"
		"doas.diff")
sha256sums=("SKIP"
            "5c48cde4ad155e357857f56ec2ce4d26d3e3fdd12b141e349640775481539ed9"
			"5451d155619be5b7992379e8d76c1766384feead3b404fad5bf4bccea6c3cd94")

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed "s/^v//;s/-/./g"

}

prepare() {
  cd "${_pkgname}"
  patch -p1 -i ${srcdir}/doas.diff
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}/" install
  
  install -Dm644 ../papirus-folders.hook "${pkgdir}/usr/share/libalpm/hooks/papirus-folders.hook"  
}
