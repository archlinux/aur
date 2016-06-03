# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

# NOTES:
# Install this package instead of 'archdroid-icon-theme-git'.
#
# The git variant of this package, 'archdroid-icon-theme-git',
#   is NOT a newer release than this one.
#   Both packages are always updated at the same time.
# This package downloads and installs MUCH faster than the git variant:
#   'archdroid-icon-theme' == 1MB download,
#   'archdroid-icon-theme-git' == 40MB download.
# In other words, choose this package over 'archdroid-icon-theme-git',
#   unless you have a specific reason to download the other one
#   (e.g., this package doesn't download correctly).
# 
# To revert to an older version, you can find them here:
#   https://github.com/GreenRaccoon23/archdroid-icon-theme/raw/master/bak

pkgname=archdroid-icon-theme
pkgver=r105.d08b8b8
pkgrel=1
pkgdesc="Port of Android 5.0 Lollipop's material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname}"
license=('GPL3')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=('!strip')
install="${pkgname}.install"
source=("https://github.com/GreenRaccoon23/${pkgname}/raw/master/${pkgname}.tar.xz")
# To revert to an older version, find them here:
#   https://github.com/GreenRaccoon23/archdroid-icon-theme/raw/master/bak
md5sums=("dbde07a153182f61fce5295d88959658")

prepare() {
  if fc-list | grep Roboto >/dev/null; then
    return;
  fi;

  error "Required font 'Roboto' is not installed."
  error "Please install a font package which includes 'Roboto', such as:"
  for e in ttf-roboto ttf-roboto-font ttf-google-fonts-git ttf-google-fonts-hg otf-google-fonts-hg; do
    echo "${e}";
  done;
  return 1;
}

package() {
  msg2 "Installing ${pkgname}...";
  cd ${pkgname};
  install -dm 755 "${pkgdir}"/usr/share/icons;
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
}

