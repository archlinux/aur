# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

# NOTE: Please install 'archdroid-icon-theme' instead.
#
# Both packages provide the same version, but 'archdroid-icon-theme'
# installs faster.
#
# This package is a fallback in case 'archdroid-icon-theme' fails to
# install.
#
# Please report bugs in the AUR comments or here:
# https://github.com/GreenRaccoon23/archdroid-icon-theme/issues
#
# Please submit suggestions, ideas, or requests through the link above.
# I would appreciate your feedback and am open to requests.

pkgname=archdroid-icon-theme-git
pkgver=r131.5143e7847
pkgrel=2
pkgdesc="Port of Android 5/6 (Lollipop/Marshmallow)'s material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname%-*}"
license=('GPL3')
depends=('ttf-roboto')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
install="${pkgname%-*}.install"
source=("git+https://github.com/GreenRaccoon23/${pkgname%-*}.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  msg2 "Installing ${pkgname%-*}...";
  cd "${pkgname%-*}/${pkgname%-*}";
  install -dm 755 "${pkgdir}"/usr/share/icons/;
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
};
