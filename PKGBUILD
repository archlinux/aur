# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

pkgname=lib32-babl
_pkgbase=babl
pkgver=0.1.74
_commit=501c71495c9f4670ee066e3abe2ad6710e954084  # tags/BABL_0_1_74^0
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
sha512sums=('4ab96906c98588601fac2593a2086a056003adb9acaf8595abdb460a4367d0f12e8107e49e5674bcbf15010e9b653c4e489add42755f77212ec7bab8e7dfb7fc'
            'e2417d6a72c44fc5c7721870b5124c1aefea4c772ed26e7f961e358c541fa53a8716aca689c0733e4f2d4ab36926d88cf069e474beb0eb12d2a39436df669dd1'
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

