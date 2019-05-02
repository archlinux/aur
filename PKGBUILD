# Maintainer: fwhcat <fabien.wang@gmail.com>

_pkgname=windows10-gtk-theme
pkgname=${_pkgname}-git
pkgver=r195.8045e62
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # remove useless files
	rm -rf ".git"

  # create theme dir
  install -d -m 755 "$pkgdir/usr/share/themes/Windows10"

  # install theme
  find . -type f -exec \
  install -D -m 644 '{}' "$pkgdir/usr/share/themes/Windows10/{}" \;
}
