# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog
# Contributor: duck <duck@vmail.me>

pkgname=glew-wayland
pkgver=2.2.0
pkgrel=1
pkgdesc='The OpenGL Extension Wrangler Library, for Wayland'
arch=(x86_64)
url='https://glew.sourceforge.net/'
license=(BSD GPL MIT)
depends=(glu libxi libxmu)
conflicts=(glew)
provides=(glew)
source=("https://downloads.sourceforge.net/glew/glew-$pkgver.tgz")
sha256sums=('d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1')

prepare() {
  cd glew-$pkgver
  sed -i '/^.PHONY: .*\.pc$/d' Makefile
  sed -i 's,lib64,lib,' config/Makefile.linux
}

build() {
  make STRIP= SYSTEM=linux-egl -C glew-$pkgver
}

package_glew-wayland() {
  cd glew-$pkgver
  make GLEW_DEST="$pkgdir/usr" SYSTEM=linux-egl install.all
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
