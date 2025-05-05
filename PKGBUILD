# Maintainer: envolution
# Contributor: Florian Pritz <f-p@gmx.at>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xautolock
pkgver=2.2
pkgrel=8
pkgdesc="An automatic X screen-locker/screen-saver"
arch=(x86_64 i686)
url="https://ibiblio.org/pub/Linux/X11/screensavers/"
license=('GPL-2.0-only')
depends=('libxss')
makedepends=('imake')
source=("https://ibiblio.org/pub/Linux/X11/screensavers/$pkgname-$pkgver.tgz"
  10-fix-memory-corruption.patch
  11-fix-no-dpms.patch
  12-fix-manpage.patch
  13-fix-hppa-build.patch
  14-do-not-use-union-wait-type.patch
  15-rephrase-manpage.patch
  16-unlimit-maxtimes.patch
)
sha256sums=('11f0275175634e6db756e96f5713ec91b8b1c41f8663df54e8a5d27dc71c4da2'
            '1a2f8a91b4f93e3fb7b4dd936b22921bd4d1e767e8048fe8584f4105b0e33876'
            '21cbb175120e9fa6f88868a2a7de2f14a91f4105db140463944eb19cbd34e903'
            'c33de1a16efee4fdf3c8da82b9e52b0170969d9aa6f590eef8dbeb4c749e1d7a'
            '199aff2615bcdae8de0008e1af47a510fca4e305341cd3ab129846adde71fab1'
            '891d4967f771a32fa7416c7fbc1d3587b1e6532f81676869e230e1adb4a36b2f'
            '35bc2fc9ed8cdb424de990af4840718da0e1ed10286abbf16c774002738b140e'
            '7cf8ac467dc263c6a6edbdca5ee34bded213bfb7b069f386df417a50fb663b12')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../10-fix-memory-corruption.patch
  patch -Np1 -i ../11-fix-no-dpms.patch
  patch -Np1 -i ../12-fix-manpage.patch
  patch -Np1 -i ../13-fix-hppa-build.patch
  patch -Np1 -i ../14-do-not-use-union-wait-type.patch
  patch -Np1 -i ../15-rephrase-manpage.patch
  patch -Np1 -i ../16-unlimit-maxtimes.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
  install -Dm644 License -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim:set ts=2 sw=2 et:
