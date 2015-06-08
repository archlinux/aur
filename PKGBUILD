# Maintainer: 2ion <dev@2ion.de>
pkgname=bunsen-themes-git
pkgver=r2.3a2993b
pkgrel=1
pkgdesc="BunsenLabs GTK/Openbox/Lightdm Themes"
arch=('any')
url="https://github.com/BunsenLabs/bunsen-themes"
license=('GPL3' 'CCPL:by-sa')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=(                                                    \
  'lib32-gtk-engine-murrine: required for multilib (GTK2)'      \
  'gtk3: required for the GTK3 themes')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('bunsen-themes::git+https://github.com/BunsenLabs/bunsen-themes.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -d "$pkgdir"/usr/share/themes
  install -d "$pkgdir"/usr/share/doc/bunsen-themes-git

  cp -r Bunsen-Blackish Bunsen-Blue-Dark Bunsen-Blue Bunsen-Dark Bunsen-lightdm Bunsen CrunchBang "$pkgdir"/usr/share/themes
  cp LICENSE.{GPL,CC} "$pkgdir"/usr/share/doc/bunsen-themes-git
}
