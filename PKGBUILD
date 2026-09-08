# Submiter: ZekeSulastin <zekesulastin@gmail.com>
# Maintainer: AdrianoML <adriano.lols@gmail.com>
# Maintainer: Cazzoo <caz.san@gmail.com>

pkgname=jstest-gtk-git
pkgver=0.1.0.r163.gd910b1c
pkgrel=1
pkgdesc="A simple GTK2-based joystick tester and calibrator"
arch=('i686' 'x86_64')
url="https://github.com/Grumbel/jstest-gtk"
source=("git+$url.git"
		'jstest-gtk.desktop')
license=('GPL3')
depends=('gtkmm3')
makedepends=('git' 'cmake')
_gitname="jstest-gtk"

sha256sums=('SKIP'
            '8063bdd1426bd772396929bc044de933db40a9888663bc72556ffc62a255c0fc')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  if [[ ! -e 'build' ]]; then
      mkdir build
  fi
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_gitname"

  install -D -m755 build/jstest-gtk "${pkgdir}/usr/bin/jstest-gtk"
  install -D -m644 "./data/icons/generic.png" "${pkgdir}/usr/share/icons/jstest-gtk.png"
  install -D -m644 "../jstest-gtk.desktop" "${pkgdir}/usr/share/applications/jstest-gtk.desktop"
  mkdir -p "${pkgdir}/usr/share/jstest-gtk"
  cp -r "../jstest-gtk/data/"* "${pkgdir}/usr/share/jstest-gtk/"
}
