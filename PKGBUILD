# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac
pkgver=1.30
pkgrel=4
pkgdesc="Freeware Advanced Audio Coder"
arch=(x86_64)
url="https://www.audiocoding.com/"
license=(GPL2 custom)
depends=(glibc)
provides=(libfaac.so)
source=(
  https://github.com/knik0/$pkgname/archive/${pkgver/./_}/$pkgname-${pkgver/./_}.tar.gz
  $pkgname-1.30-pkgconfig.patch::https://github.com/knik0/faac/commit/11215a2dc792d28a8fa7bbef059c6798d248a0ea.patch
)
sha512sums=('8582cd580dba2a347d15dc4fab42020d7120d0552c54ab74cfaf59ba1b270abb94c67e39d42459a14cbc6e98f3fd00cbda589e1b4f0c7278e41bdef6ae7b6554'
            '3dafe1c6921758a4610a49d8ae106e9fb6dccdd0d5cc3a3eedf8c91c01f1eaa0ee6b65cadfb86ae47093f35499baa8d795397457f7b34280b02199095c6f9e29')
b2sums=('ee3cf1ad44c14ec289036c9a6f087df3a1cf81c9b0f60b6a2121f5badba3f3cab983001437bb6051ab2306c0e5e14ee8e3c9439116bd82c370f808d912ce2c13'
        'ccb6d86c8a23ded205c6f0baa24172f753e98649e35c98031c401a9154444bac923ec0d89a811cc1a6ac868347d46878cd2443028abec8fdc24020084c4c725b')

prepare() {
  cd $pkgname-${pkgver/./_}
  # add pkg-config file
  patch -Np1 -i ../$pkgname-1.30-pkgconfig.patch
  autoreconf -fiv
}

build() {
  cd $pkgname-${pkgver/./_}
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-${pkgver/./_}
  make DESTDIR="$pkgdir" install
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
