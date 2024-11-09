# Maintainer: Gilles Gagniard <gilles@gagniard.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=qqc2-desktop-style-fractional
_pkgname=qqc2-desktop-style
pkgver=6.8.0
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gcc-libs
         glibc
         kcolorscheme
         kconfig
         kiconthemes
         kirigami
         qt6-base
         qt6-declarative
         sonnet)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz{,.sig}
	force_qttextrendering.patch
	)
sha256sums=('e9692f00d79b963bdcae716caab964c2534750c85d7fe02fce7a908003eb4da3'
	    'SKIP'
	    '54fbccab11a759f3ce6b7e537037426458909fb542c359a2f073fa0f5c302a17'
            )
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )

conflicts=(qqc2-desktop-style)
provides=(qqc2-desktop-style)

prepare() {
 patch -d $_pkgname-$pkgver -Np1 -i ../force_qttextrendering.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
