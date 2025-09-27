# Maintainer: artist for Xlibre

_pkgname=xlibre-server
_orgpkgname=xlibre-xserver
pkgname=$_pkgname-bin
pkgver=25.0.0.12
pkgrel=1
pkgdesc="XLibre Official Easy Install Drop in Replacement fork of X.Org X server (binary release)"
arch=(x86_64)
url="https://github.com/X11Libre/xserver"
license=('LicenseRef-Adobe-Display-PostScript'
         'BSD-3-Clause'
         'LicenseRef-DEC-3-Clause'
         'HPND'
         'LicenseRef-HPND-sell-MIT-disclaimer-xserver'
         'HPND-sell-variant'
         'ICU'
         'ISC'
         'MIT'
         'MIT-open-group'
         'NTP'
         'SGI-B-2.0'
         'SMLNJ'
         'X11'
         'X11-distribute-modifications-variant')
groups=('xlibre')
options=(!strip)
source=("https://github.com/X11Libre/binpkg-arch-based/raw/refs/heads/main/${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${_pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
depends=(xlibre-server-common-bin xlibre-input-libinput-bin libepoxy libxfont2 pixman libunwind
         dbus libgl nettle libxdmcp sh glibc libxau libtirpc libmd
         libpciaccess libdrm libxshmfence libxcvt) # FS#52949
# see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
# and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
provides=($_pkgname 'xorg-server' 'X-ABI-VIDEODRV_VERSION=28.0' 'X-ABI-XINPUT_VERSION=26.0' 'X-ABI-EXTENSION_VERSION=11.0' 'x-server')
conflicts=($_pkgname 'xorg-server' 'xorg-server-common<25.0.0.0' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
replaces=('glamor-egl' 'xf86-video-modesetting')
install=$pkgname.install

sha256sums=('02d7f0d8ba1dfd4d7cef371fbac8cedb3d73ffd97098135c89e11b5850794d5a')

package() {
  tar -xf "${_orgpkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" -C "${pkgdir}" etc usr
}

