# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.78
_commit=24c3666768d5530541e1dbdeb0354a37132213ff  # tags/BABL_0_1_78^0
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library (32-bit)"
arch=(x86_64)
url="https://gegl.org/babl/"
license=('LGPL3')
depends=('babl' 'lib32-glibc' 'lib32-lcms2')
makedepends=(meson gobject-introspection)
source=("https://gitlab.gnome.org/GNOME/$_pkgbase/-/archive/$_commit/$_pkgbase-$_commit.tar.gz"
        "git-version.h"
        "x86-linux-gnu"
        "pkgconf32")
sha512sums=('b95a50663fda986f6ca9bad22a9a694418d92a12e8d9f05f1473396f6f760d0bef16ebc2193de7d0542442023c76a90c51b59f39e3d91cd90e86d442507b43dc'
            'd82fef33fac963418c2425a9304b35bad5182ed2813cc2ffe3f6ffec526b3ef99837f730acdc509e5d497b5751ca9b5e05bb8aa46ce420ba3ff28ba223d9bbbd'
            'c90a2e8d8753d4474afbaa5f1def579b4fe9580904b25125e2f942fa722a6ed54340e467d2ddf60ab9d3aeeeb93f5f740502cafe9a1f52d55da3bd78baa3b5c5'
            'f21dd90f4f9caf67854f68baddbfbfecda295cb53f0444a1c0bfb98246390ae5d48ba5a0892fecf8a7faa937ef88884743a8e4282ca98d54c0da80c5457ef066')

prepare() {
  cp "git-version.h" "${_pkgbase}-$_commit/babl/"
}

build() {
  mkdir -p "build"
  arch-meson "${_pkgbase}-$_commit" "build" --cross-file x86-linux-gnu --libdir=/usr/lib32
  ninja -C "build"
}

package() {
  DESTDIR="$pkgdir" ninja -C "build" install
  rm -r "$pkgdir/usr/"{share,include}
}

