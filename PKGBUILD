# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=pizmidi-git
pkgver=44.a985e3d
pkgrel=1
pkgdesc="a comprehensive suite of VST MIDI plugins"
arch=("i686" "x86_64")
license=('LGPL')
url="https://bitbucket.org/agraef/pizmidi/"
depends=('steinberg-vst36')
makedepends=()
source=("git+https://bitbucket.org/agraef/pizmidi")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/pizmidi
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $srcdir/pizmidi/pizmidi
  make || return 1
}

package() {
  cd $srcdir/pizmidi/Release
  mkdir -p "$pkgdir/usr/lib/vst/pizmidi"
  cp *.so *.ini "$pkgdir/usr/lib/vst/pizmidi"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -m644 ../README* pizmidi.txt "piz midi VST plugins.pdf" "$pkgdir/usr/share/doc/$pkgname/"
  cp -R doc "$pkgdir/usr/share/doc/$pkgname/"
}
