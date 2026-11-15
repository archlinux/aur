# Maintainer: Sokpiseth Thin <sokpiseth.thin@gmail.com>
pkgname=yt-music-gpui-bin
_pkgname=yt-music-gpui
pkgver=0.2.2
pkgrel=1
pkgdesc='Native YouTube Music client built with GPUI (release binary)'
arch=('x86_64')
url='https://github.com/AksharP5/yt-music-gpui'
license=('MIT' 'Apache-2.0' 'ISC' 'OFL-1.1' 'BSD-3-Clause' 'Unlicense')
depends=('glibc>=2.39' 'gcc-libs' 'mpv>=0.38' 'libglvnd' 'wayland'
         'libx11' 'libxext' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11'
         'fontconfig' 'freetype2' 'vulkan-icd-loader' 'vulkan-driver'
         'python>=3.10' 'libsecret' 'xdg-utils')
optdepends=('gnome-keyring: Secret Service provider for saving sign-in credentials'
            'kwallet: alternative Secret Service provider')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('30eca142348201068fbf6bfa4932b18d9b53a9f90e7ae4276737eadd3543c2b2')

prepare() {
  mkdir -p release
  bsdtar -xf data.tar.zst -C release
}

package() {
  cp -r --preserve=mode,timestamps release/usr "$pkgdir/"
  # Arch keeps license texts under /usr/share/licenses rather than /usr/share/doc.
  install -d "$pkgdir/usr/share/licenses"
  mv "$pkgdir/usr/share/doc/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$pkgdir/usr/share/doc"
}
