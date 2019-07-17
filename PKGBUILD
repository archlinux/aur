# Maintainer: LightQuantum<cy.n01@outlook.com>

pkgname=kitty-without-monolimit-git
pkgver=0.14.2.r168.g9368f7f6
pkgrel=1
pkgdesc="A modern, hackable, featureful, OpenGL based terminal emulator (monospace font limit removed)."
arch=(i686 x86_64)
url="https://github.com/kovidgoyal/kitty"
license=(GPL3)
depends=(python3 freetype2 fontconfig wayland libx11 libgl)
makedepends=(git python-setuptools libxinerama libxcursor libxrandr libxkbcommon libxkbcommon-x11 glfw-x11 wayland-protocols mesa python-sphinx)
optdepends=('imagemagick: viewing images with icat')
provides=(kitty)
conflicts=(kitty)
source=("git+https://github.com/kovidgoyal/kitty.git" "kitty.patch")
md5sums=('SKIP'
         'ac7ea79c862f3d74f6b87804e433e6b7')

prepare() {
  cd "$srcdir/${pkgname/-git/}"
  patch --strip=1 --input="${srcdir}/kitty.patch"
}

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname/-git/}"

  python3 setup.py linux-package --prefix "${pkgdir}"/usr
}
