# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=archdroid-icon-theme-git
pkgver=r86.ab8e2ae
pkgrel=1
pkgdesc="Port of Android 5.0 Lollipop's material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname%-*}"
license=('GPL3')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
#options=('!strip')
install="${pkgname%-*}.install"
source=("git+https://github.com/GreenRaccoon23/${pkgname%-*}.git")
md5sums=("SKIP")

_error2() {
  for e; do
    echo "    ${e}";
  done;
}

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  if fc-list | grep Roboto >/dev/null; then
    return;
  fi;

  error "Required font 'Roboto' is not installed."
  error "Please install a font package which includes 'Roboto', such as:"
  _error2 ttf-roboto ttf-roboto-font ttf-google-fonts-git ttf-google-fonts-hg otf-google-fonts-hg;
  return 1;
}

package() {
  msg2 "Installing ${pkgname%-*}..." ;
  cd "${pkgname%-*}/${pkgname%-*}";
  install -dm 755 "${pkgdir}"/usr/share/icons/;
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
}
