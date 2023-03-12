# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=glcapsviewer-git
pkgver=r137.85ee6ab
pkgrel=1
pkgdesc='OpenGL Hardware Capability Viewer'
url='https://opengl.gpuinfo.org/'
arch=('i686' 'x86_64')
license=('GPL3')
source=('git+https://github.com/SaschaWillems/glCapsViewer'
        'https://github.com/SaschaWillems/glCapsViewer/pull/15.patch'
        'https://github.com/SaschaWillems/glCapsViewer/pull/34.patch'
        'glcapsviewer.desktop')
sha256sums=('SKIP'
            '1bbc59c259e18a550d788688be7a731e1f379ee08902759cf3e802123b745493'
            '6ac078025a400b5ef90f3756a5207b0d326bb0bfcc4488468c0bb7c627397589'
            '3ff750cda95917ff93388dd373437b12129427bc33e52343247bf69bf1d24c02')
makedepends=('git' 'cmake')
depends=('glew' 'glfw' 'qt5-base')

pkgver() {
  cd "$srcdir"/glCapsViewer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/glCapsViewer

  patch -p1 -i "$srcdir"/15.patch
  patch -p1 -i "$srcdir"/34.patch
}

package() {

  cd "$srcdir"/glCapsViewer
  cmake .
  cmake --build .


  install -dm755 "$pkgdir"/usr/bin
  install -m755 "$srcdir"/glCapsViewer/glcapsviewer "$pkgdir"/usr/bin/glcapsviewer

  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 "$srcdir"/glcapsviewer.desktop "$pkgdir"/usr/share/applications/glcapsviewer.desktop
}
