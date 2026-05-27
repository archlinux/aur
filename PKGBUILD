# Maintainer: Twilit Realm <https://github.com/TwilitRealm/dusklight>
pkgname=dusklight-bin
pkgver=1.3.1
pkgrel=1
_desktop_id=dev.twilitrealm.dusk
pkgdesc='PC port of a classic adventure game'
arch=('x86_64')
url='https://github.com/TwilitRealm/dusklight'
license=('CC0-1.0')
depends=(
  'fuse2'
  'hicolor-icon-theme'
  'glibc'
  'gcc-libs'
  'zlib'
  'gmp'
  'e2fsprogs'
  'freetype2'
)
optdepends=(
  'vulkan-icd-loader: Vulkan rendering support'
  'libglvnd: OpenGL/EGL rendering support'
  'libx11: X11 video backend'
  'libxkbcommon: Wayland input support'
  'alsa-lib: ALSA audio backend'
  'libpulse: PulseAudio/PipeWire audio backend'
)
provides=('dusklight')
conflicts=('dusklight')
options=('!strip')
source=(
  "${_desktop_id}.desktop::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/${_desktop_id}.desktop"
  "LICENSE.md::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/LICENSE.md"
  "16x16-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/16x16/apps/${_desktop_id}.png"
  "32x32-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/32x32/apps/${_desktop_id}.png"
  "48x48-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/48x48/apps/${_desktop_id}.png"
  "64x64-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/64x64/apps/${_desktop_id}.png"
  "128x128-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/128x128/apps/${_desktop_id}.png"
  "256x256-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/256x256/apps/${_desktop_id}.png"
  "512x512-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/512x512/apps/${_desktop_id}.png"
  "1024x1024-${_desktop_id}.png::https://raw.githubusercontent.com/TwilitRealm/dusklight/v${pkgver}/platforms/freedesktop/1024x1024/apps/${_desktop_id}.png"
)
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/TwilitRealm/dusklight/releases/download/v${pkgver}/Dusklight-v${pkgver}-linux-x86_64.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha256sums=('6671ee17ed017db6e2175bdd68e82b724427b98696547a1e3ce2599672e689c6'
            '6d489af6292662d9e36d34ce49423784984a5f6e41d7b58f49b01264df59fa03'
            '6c4d46fbc852fa9d3b4037ad42ff4ebaab77e2620f8e0fa66d83c9e347b3883f'
            'a472d91aaf2c92677be45efe715f6b395c55562251d1574f5f0f62de4c8252d7'
            '495b4a9f92b97610c10de697ff7da9993b8fc6c96dc409c6ad67d0d718d0d311'
            'b335e89bc65693499dde7098aadd17c0a45aaed72237546a40d98d82a355c6b5'
            '4859aaf2770c03ce9d16c029f609917d25aaa7d38c0fa22814f49ce792932e32'
            '48f9aba6b3309650cc23df507834601f13aef657212cda957f3d6458db7e5487'
            '223800f8c29c7d4dad7af0c1f947dec3120120507bdea0c0d6d08366840f5aef'
            '49afadfd709bbfd2ecb5c9036d880a972561e5839d1ae2c51e67a9ad2dc5e7fb')
sha256sums_x86_64=('46e36dc50fb6e16dd9553ff5bfa67942ade97994807a52eefbc84439b9ae228f')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/dusklight/dusklight.AppImage"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/dusklight" <<'EOF'
#!/bin/sh
exec /opt/dusklight/dusklight.AppImage "$@"
EOF

  install -Dm644 "${srcdir}/${_desktop_id}.desktop" \
    "${pkgdir}/usr/share/applications/${_desktop_id}.desktop"
  install -Dm644 "${srcdir}/LICENSE.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  local size
  for size in 16 32 48 64 128 256 512 1024; do
    install -Dm644 "${srcdir}/${size}x${size}-${_desktop_id}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_desktop_id}.png"
  done
}
