# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

pkgname=archdroid-icon-theme
pkgver=r86.ab8e2ae
pkgrel=1
pkgdesc="Port of Android 5.0 Lollipop's material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname}"
license=('GPL3')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}")
#options=('!strip')
install="${pkgname}.install"
source=("https://github.com/GreenRaccoon23/${pkgname}/raw/master/${pkgname}.tar.xz")
# To revert to an older version, find them here:
#   https://github.com/GreenRaccoon23/archdroid-icon-theme/raw/master/bak
md5sums=("8ca3630ee86e77799c013e9d10314360")

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

