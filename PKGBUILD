# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Piotr Krzemiński <pio.krzeminski@gmail.com>

pkgname=thinkgui
pkgver=r22.8544d61
pkgrel=1
pkgdesc="GUI toolkit for ThinkPad laptops"
arch=('i686' 'x86_64')
url="https://github.com/krzemin/thinkgui"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
source=('git+https://github.com/krzemin/thinkgui.git'
        'thinkgui-fix-cpu-permissions.sh')
sha256sums=('SKIP'
            '618091a9422cf4e46dab4e03f85fba77181bd266320f4c2e6a0cc8fa3980daaa')
options=('docs')

_gitname="thinkgui"

pkgver() {
  cd "${srcdir}/${_gitname}"
  
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="$pkgdir" install
  install -D -m755 "$srcdir/thinkgui-fix-cpu-permissions.sh" "$pkgdir/usr/lib/systemd/system-sleep/thinkgui-fix-cpu-permissions.sh"
}

