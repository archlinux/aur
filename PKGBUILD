# Maintainer: fwhcat <fabien.wang@gmail.com>

_pkgname=windows10-gtk-theme
pkgname=${_pkgname}-git
pkgver=3.2.r2.g06dd5b8
pkgrel=1
pkgdesc="Windows 10 GTK theme"
arch=('any')
url="https://github.com/B00merang-Project/Windows-10"
license=('GPL3')

depends=('gtk-engines' 'gtk-engine-murrine')
optdepends=('gnome-themes-standard' 'windows10-icon-theme-git' 'windows10-tint2rc')
makedepends=('git')

provides=("${_pkgname}-git")
conflicts=("${_pkgname}-git")

source=("${_pkgname}::git+https://github.com/B00merang-Project/Windows-10.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  # install theme
  find * -type f -exec \
  install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;
}
