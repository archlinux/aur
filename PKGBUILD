# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>

pkgname=agg
pkgver=2.5
pkgrel=9
pkgdesc='High Quality Rendering Engine for C++'
arch=('x86_64')
url='https://src.fedoraproject.org/rpms/agg'
license=('GPL')
depends=('gcc-libs' 'sdl' 'freetype2')
provides=('antigrain')
replaces=('antigrain')
source=("https://sources.archlinux.org/other/community/agg/$pkgname-free-$pkgver.tar.gz"
        agg-2.4-depends.patch
        agg-2.5-pkgconfig.patch
        agg-2.5-autotools.patch
        0001-Fix-non-terminating-loop-conditions-when-len-1.patch
        0002-Cure-recursion-by-aborting-if-the-co-ordinates-are-t.patch
        0003-Get-coordinates-from-previous-vertex-if-last-command.patch
        0004-Make-rasterizer_outline_aa-ignore-close_polygon-when.patch
        0005-Remove-VC-6-workaround.patch
        0006-Implement-grain-merge-blending-mode-GIMP.patch
        0007-Implement-grain-extract-blending-mode-GIMP.patch
        0008-Declare-multiplication-and-division-operators-as-con.patch
        0009-Add-a-static-identity-transformation.patch
        0010-Add-renderer_scanline_aa_alpha.patch
        0011-Avoid-division-by-zero-in-color-burn-mode.patch
        0012-Avoid-pixel-artifacts-when-compositing.patch
        0013-Modify-agg-conv-classes-to-allow-access-to-the-origi.patch
        0014-Avoid-potential-zero-division-resulting-in-nan-in-ag.patch
        0015-Ensure-first-value-in-the-gamma-table-is-always-zero.patch
        bad-const.patch)
md5sums=('d84c648bc2b57266e33d702c1af2a786'
         '22f8e48c137d25038181c86d5e40b110'
         '43a19a7b1564c591e56c8d09a0fd8da5'
         'e042231955a8daee5f3cdfa4ee4e866a'
         '2f701b49c441f1b91694600ff9d219e4'
         '9e46762241b223ff4c7fba36f82628fa'
         'd7597bd1c17c5623b1af6b79c68986f4'
         '97d25ec4d0571e74324a433f2fe5d11d'
         'af7a447a4b0469cd263cf3e65a7464e6'
         '30a1d8cd1b657b7b51655f2e5e888031'
         'a7bd6df05c6504d9066f7a954f07baf6'
         'b438aa60165cccb406e20b6e0f0267d2'
         '6ce59e5aa2c993ef66aed9bae4345284'
         '67bedac31a1e8d40da7bb32c84a6159d'
         'fb8f3902a39fcb1f065fc46b72567869'
         '02e7df597ce0174cb3f8c665bcc6e436'
         '398c544671060b45b70ed24ada3285f4'
         'da05a1ef008e2702d2b0ca379ea07e2a'
         '703351fc0af2d5e21ec3d67fcf112d0d'
         'd25d0763a4e52111cd2f5716505cced8')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i ../agg-2.4-depends.patch
  patch -p1 -i ../agg-2.5-pkgconfig.patch
  patch -p0 -i ../agg-2.5-autotools.patch
  patch -p1 -i ../0001-Fix-non-terminating-loop-conditions-when-len-1.patch
  patch -p1 -i ../0002-Cure-recursion-by-aborting-if-the-co-ordinates-are-t.patch
  patch -p1 -i ../0003-Get-coordinates-from-previous-vertex-if-last-command.patch
  patch -p1 -i ../0004-Make-rasterizer_outline_aa-ignore-close_polygon-when.patch
  patch -p1 -i ../0005-Remove-VC-6-workaround.patch
  patch -p1 -i ../0006-Implement-grain-merge-blending-mode-GIMP.patch
  patch -p1 -i ../0007-Implement-grain-extract-blending-mode-GIMP.patch
  patch -p1 -i ../0008-Declare-multiplication-and-division-operators-as-con.patch
  patch -p1 -i ../0009-Add-a-static-identity-transformation.patch
  patch -p1 -i ../0010-Add-renderer_scanline_aa_alpha.patch
  patch -p1 -i ../0011-Avoid-division-by-zero-in-color-burn-mode.patch
  patch -p1 -i ../0012-Avoid-pixel-artifacts-when-compositing.patch
  patch -p1 -i ../0013-Modify-agg-conv-classes-to-allow-access-to-the-origi.patch
  patch -p1 -i ../0014-Avoid-potential-zero-division-resulting-in-nan-in-ag.patch
  patch -p1 -i ../0015-Ensure-first-value-in-the-gamma-table-is-always-zero.patch
  patch -p1 -i ../bad-const.patch

  aclocal
  autoheader
  autoconf
  libtoolize -f
  automake --foreign -a -i
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
