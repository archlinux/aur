# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

# NOTES:
# Install this package instead of 'archdroid-icon-theme-git'.
#
# The git variant of this package, 'archdroid-icon-theme-git',
#   is NOT a newer release than this one.
#   Both packages are always updated at the same time.
# This package downloads and installs MUCH faster than the git variant:
#   'archdroid-icon-theme' == 1MB download,
#   'archdroid-icon-theme-git' == 50MB download.
# In other words, choose this package over 'archdroid-icon-theme-git',
#   unless you have a specific reason to download the other one
#   (e.g., this package doesn't download correctly).
#
# To revert to an older version, use an archive here:
#   https://raw.githubusercontent.com/GreenRaccoon23/archdroid-icon-theme/raw/master/bak
#
# Since this theme is comprised of svg images, it uses local fonts.
#   The few icons which display text require the Roboto font.
# If you do not have Roboto installed but want to install this theme anyway,
#   comment out the `prepare()` function or insert a `return` at the top of it.

pkgname=archdroid-icon-theme
pkgver=r114.ce01a58
pkgrel=2
pkgdesc="Port of Android 5/6 (Lollipop/Marshmallow)'s material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname}"
license=('GPL3')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
options=('!strip')
install="${pkgname}.install"
# To revert to an older version, use an archive from here:
#   https://raw.githubusercontent.com/GreenRaccoon23/archdroid-icon-theme/raw/master/bak
source=("https://raw.githubusercontent.com/GreenRaccoon23/${pkgname}/master/${pkgname}.tar.xz")
# If you see an error like this:
#     ==> ERROR: One or more files did not pass the validity check!
# then comment out or delete the line below.
md5sums=("db3cd391f7f1d7ed767b6cff4a85475c")

prepare() {
  if fc-list | grep Roboto >/dev/null; then
    return;
  fi;

  error "Required font 'Roboto' is not installed.";
  error "Please install a font package which includes 'Roboto', such as:";
  for e in ttf-roboto ttf-roboto-font ttf-google-fonts-git ttf-google-fonts-hg otf-google-fonts-hg; do
    echo "${e}";
  done;
  return 1;
};

package() {
  msg2 "Installing ${pkgname}...";
  cd ${pkgname};
  install -dm 755 "${pkgdir}"/usr/share/icons;
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
};
