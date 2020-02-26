# $Id$
# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Denis A. Altoe Falqueto <denisfalqueto@gmail.com>

_gitname=projectm
pkgname=projectm-git
pkgver=1966.533e5542b
pkgrel=1
conflicts=('projectm' 'projectm-sdl' 'projectm-pulseaudio')
provides=('projectm' 'projectm-sdl' 'projectm-pulseaudio')
pkgdesc="Music visualizer which uses 3D accelerated iterative image based rendering (git version)"
arch=('x86_64' 'i686')
url='https://github.com/projectM-visualizer/projectm'
license=('LGPL')
depends=('sdl2' 'libxext' 'glm')
source=("git+https://github.com/projectM-visualizer/${_gitname}.git")
sha256sums=(SKIP)

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr --enable-sdl
  make
}

package() {
  cd "${_gitname}"
  DESTDIR="$pkgdir" make install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
