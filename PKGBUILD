# Maintainer: infinitebash <aur at infinitebash dot com>
_pkgname="gnome-shell-extension-colorblind-filters"
pkgname="${_pkgname}-git"
_uuid="colorblind-filters@G-dH.github.com"
pkgver=r51.4a0147c
pkgrel=1
pkgdesc="A GNOME Shell extension for main panel that offers full-screen color filters that should help color-blind users and developers."
arch=(any)
url="https://github.com/G-dH/gnome-colorblind-filters"
license=('GPLv3')
depends=(gnome-desktop)
makedepends=(git make zip unzip)
provides=(gnome-colorblind-filters)
source=("${_pkgname}::git+https://github.com/G-dH/gnome-colorblind-filters")
sha256sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
	make zip
}

package() {
  mkdir -p ${pkgdir}/usr/share/gnome-shell/extensions/$_uuid
  cd ${pkgdir}/usr/share/gnome-shell/extensions/$_uuid 
  unzip "${srcdir}/${_pkgname}/$_uuid.zip"
}
