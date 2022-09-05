# Maintainer : Antonio Orefice <xt7player@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=higgins-git
pkgver=r441.a4d00dc
pkgrel=1
pkgdesc="Yet another application launcher, search for things, do calculations or whatever you want through external plugins"
arch=('any')
license=('GPL')
url="https://github.com/kokoko3k/higgins"

makedepends=('gambas3-dev-tools' 'git')

depends=( 
        'schedtool'
        'gambas3-runtime>=3.1.1'
        'gambas3-gb-form>=3.1.1'
        'gambas3-gb-qt5>=3.1.1'
        'gambas3-gb-desktop>=3.1.1'
        'gambas3-gb-image>=3.1.1'
        'gambas3-gb-settings>=3.1.1'
        'gambas3-gb-form-stock>=3.1.1'
        'gambas3-gb-desktop-x11'
        'gambas3-gb-web'
        'gambas3-gb-net'
        'gambas3-gb-util'
        'gambas3-gb-dbus'
        'gambas3-gb-image'
        'gambas3-gb-args'
        'gambas3-gb-image-effect'
        'gambas3-gb-util-web'
        'xbindkeys')

source=("git+https://github.com/kokoko3k/higgins.git")
md5sums=('SKIP')

pkgver() {
  cd "higgins"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd higgins

  gbc3 -e -a -g -t  -f public-module -f public-control || gbc3 -e -a -g -t -p -m
  gba3
}

package() {
  cd higgins

  install -d ${pkgdir}/usr/bin
  install -m755 higgins.gambas ${pkgdir}/usr/bin/higgins
  install -D appicon.png ${pkgdir}/usr/share/pixmaps/higgins.png
  install -D higgins.desktop ${pkgdir}/usr/share/applications/higgins.desktop
}
