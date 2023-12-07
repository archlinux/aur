# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=faac-drm
_pkgname=faac
pkgver=1.30
pkgrel=1
pkgdesc="Freeware Advanced Audio Coder with drm enabled"
arch=(x86_64)
url="https://www.audiocoding.com/"
license=(GPL2 custom)
depends=('glibc' 'faac')
provides=(libfaac_drm.so)
source=(
  https://github.com/knik0/$_pkgname/archive/${pkgver/./_}/$_pkgname-${pkgver/./_}.tar.gz
)
sha512sums=('8582cd580dba2a347d15dc4fab42020d7120d0552c54ab74cfaf59ba1b270abb94c67e39d42459a14cbc6e98f3fd00cbda589e1b4f0c7278e41bdef6ae7b6554')
b2sums=('ee3cf1ad44c14ec289036c9a6f087df3a1cf81c9b0f60b6a2121f5badba3f3cab983001437bb6051ab2306c0e5e14ee8e3c9439116bd82c370f808d912ce2c13')

build() {
  cd $_pkgname-${pkgver/./_}
  ./configure --enable-drm --prefix=/usr
  make
}

package() {
  cd $_pkgname-${pkgver/./_}
  make DESTDIR="$pkgdir" install

  # Remove files already included in faac
  rm -r ${pkgdir}/usr/include
  rm -r $pkgdir/usr/lib/pkgconfig/

  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
