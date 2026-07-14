# Maintainer: BlackCherry <blackcherry at danwin1210 dot de>

_pkgname=wayvr
orgname=wayvr-org
pkgname="$_pkgname-bin"
pkgver=26.7.1
pkgrel=1
pkgdesc="OpenXR desktop overlay for Wayland compositors (binary release)"
arch=('x86_64')
url="https://github.com/$orgname/$_pkgname"
license=('GPL')
options=('!debug')

provides=(
  "$_pkgname"
)

conflicts=(
  "$_pkgname"
)

depends=(
  'glibc'
  'gcc-libs'
  'libx11'
  'libxrandr'
  'libxinerama'
  'libxkbcommon'
  'wayland'
  'libdrm'
  'vulkan-icd-loader'
  'fontconfig'
  'freetype2'
  'dbus'
  'libpipewire'
  'alsa-lib'
  'openvr'
  'dav1d'
  'openxr'
)

optdepends=(
  'xwayland-satellite: X11 support'
)

source=(
    "wayvr-${pkgver}-${pkgrel}::https://github.com/$orgname/$_pkgname/releases/download/v$pkgver/wayvr"
    "wayvrctl-${pkgver}-${pkgrel}::https://github.com/$orgname/$_pkgname/releases/download/v$pkgver/wayvrctl"
    "wayvr-${pkgver}-${pkgrel}.desktop::https://raw.githubusercontent.com/$orgname/$_pkgname/refs/tags/v$pkgver/$_pkgname/wayvr.desktop"
    "wayvr-${pkgver}-${pkgrel}.png::https://raw.githubusercontent.com/$orgname/$_pkgname/refs/tags/v$pkgver/$_pkgname/wayvr.png"
    "wayvr-${pkgver}-${pkgrel}.svg::https://raw.githubusercontent.com/$orgname/$_pkgname/refs/tags/v$pkgver/$_pkgname/wayvr.svg"
)

sha256sums=('fd817f681408f0dfd97ce8d9749e9b8aa07652edf8b820a1355483f8700a372d'
            '6162877a3a4a33a588c1c33114a798f2a0ded57ae47f59f7c0cb94a38c2e6c9d'
            '7f94eac929a5139aef7b7a155c05d09626b07afdb5d9616c5aad6890b7e41297'
            '0deb4c457aaa310665ea19567875173103fc29b634a2b6169571e3a88be41399'
            'a2fb31022b6605d10dcb062f83bc3d1e71b221ed588e67c49cfb1b8e2a0db2e8')

package() {
  cd "$srcdir"

  # main binary
  install -Dm0755 "${_pkgname}-${pkgver}-${pkgrel}" \
    "$pkgdir/usr/bin/$_pkgname"

  install -Dm0755 "${_pkgname}ctl-${pkgver}-${pkgrel}" \
    "$pkgdir/usr/bin/${_pkgname}ctl"

  # .desktop file
  install -Dm0644 "${_pkgname}-${pkgver}-${pkgrel}.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # icons
  install -Dm0644 "${_pkgname}-${pkgver}-${pkgrel}.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm0644 "${_pkgname}-${pkgver}-${pkgrel}.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
