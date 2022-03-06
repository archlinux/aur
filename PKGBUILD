# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=libva-vdpau-driver
pkgver=0.7.4
pkgrel=6
pkgdesc='VDPAU backend for VA API'
arch=(x86_64)
url=https://freedesktop.org/wiki/Software/vaapi
license=(GPL)
depends=(
  libgl
  libvdpau
  libx11
)
makedepends=(
  libva
  mesa
)
source=(
  https://freedesktop.org/software/vaapi/releases/libva-vdpau-driver/libva-vdpau-driver-${pkgver}.tar.bz2
  libva-vdpau-driver-0.7.4-glext-missing-definition.patch
  libva-vdpau-driver-0.7.4-libvdpau-0.8.patch
  libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch
  libva-vdpau-driver-0.7.4-CreateSurfaceFromV4L2Buf.patch
)
b2sums=('b9cd0bbbe1e638ad29363cd0d8c6452de222023017283ce81f138730c7ba3396f3ffca40478746cab4b93a8855e73de405aa783e44e6c1179c5e347bd7eff657'
        '3c295a68cb0976f976880f13296c703c3b75abdd3311b790c132ba233e9d26975686d8b618cdda594b1aa2e5cbadee850bf2e08cc35ca2c7ee11fe10c535d91c'
        'f1bc6e3840769ce4a5e53d85867a854ddfc780e670ca095541b9f2465ca0c96f3c7ed00da596f88d0c60aa749afcaf734670ada449c8a87e27f999c74539bc78'
        '5a5a12aff1f93769d480525140e7a0d61f4db64e57f1f956d778d1ab8be881b209779030ce14b8fee53dd4cbb6a7c59a0c9297ad0c92548268c840ea0f5910b0'
        '3a7daab7f6144837e50cabd06d30709bf7fc3218e226953471f2908efad2da78cb5035f9443642381460f6ffacd0eb0c9accf7e4084fcdf12e6942c6603dbb9a')

prepare() {
  cd libva-vdpau-driver-${pkgver}

  patch -Np1 -i ../libva-vdpau-driver-0.7.4-glext-missing-definition.patch
  patch -Np1 -i ../libva-vdpau-driver-0.7.4-libvdpau-0.8.patch
  patch -Np1 -i ../libva-vdpau-driver-0.7.4-VAEncH264VUIBufferType.patch
  patch -Np1 -i ../libva-vdpau-driver-0.7.4-CreateSurfaceFromV4L2Buf.patch
}

build() {
  cd libva-vdpau-driver-${pkgver}

  ./configure \
    --prefix=/usr
  make
}

package() {
  cd libva-vdpau-driver-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
