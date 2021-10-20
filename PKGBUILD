pkgname=alpine-apk-tools
pkgver=2.12.7
pkgrel=1
pkgdesc='Alpine Package Keeper - package manager for alpine'
license=('Apache')
url='https://wiki.alpinelinux.org/wiki/Alpine_Linux_package_management'
arch=(x86_64)
source=(https://gitlab.alpinelinux.org/alpine/apk-tools/-/archive/v$pkgver/apk-tools-v$pkgver.tar.bz2
        archlinux.patch)
depends=(zlib openssl)
makedepends=(scdoc lua53 lua53-zlib)
sha512sums=('7717c623fa676155319a5e03ba8193aa1eb964c299a58bdd4d934860897f9d0b265efa7d64e7c3314421ac21a12bca32f205ae2a464d328d493b112d58c5f194'
            '3748de93c4514d0e190f20f842a76888f0fb1c8c3af0f540a89d10a6b111c94740c160ffa2afc7257429ffc5279692ed5b843105735e754749533fdaa3ca6af3')

prepare() {
  cd apk-tools-v$pkgver
  patch -p1 < ../archlinux.patch
}

build() {
  cd apk-tools-v$pkgver
  make
}

check() {
  cd apk-tools-v$pkgver
  make test
}

package() {
  cd apk-tools-v$pkgver
  make install DESTDIR="$pkgdir"
}
