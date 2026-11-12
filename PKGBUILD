# Maintainer: Obedience Corp <contact@obediencecorp.com>

pkgname=clipsync-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Clipboard sync between trusted Mac and Linux computers'
arch=('x86_64' 'aarch64')
url='https://github.com/lancekrogers/clipsync'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc' 'libcrypto.so=3-64' 'libx11' 'libxcursor' 'libxi' 'libxrender'
         'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libglvnd' 'hicolor-icon-theme')
provides=('clipsync')
conflicts=('clipsync')
# Ship the exact binaries from the GitHub release.
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}-LICENSE-MIT::https://raw.githubusercontent.com/lancekrogers/clipsync/v${pkgver}/LICENSE-MIT"
        "${pkgname}-${pkgver}-LICENSE-APACHE::https://raw.githubusercontent.com/lancekrogers/clipsync/v${pkgver}/LICENSE-APACHE")
source_x86_64=("https://github.com/lancekrogers/clipsync/releases/download/v${pkgver}/clipsync-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/lancekrogers/clipsync/releases/download/v${pkgver}/clipsync-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('135672e0a7da10ee13c40de654e8752cdab3e0be687d65bc0b6142c1ac3a2b16'
            'e9ef22dcb805f2a6bf5ef1078cf78e58ef3d1374ecdf834c69385b87d6e96d03')
sha256sums_x86_64=('fe379dd2d54ae42f9a61860a79e38b303973c56bd3409eb143864f7d6a865c95')
sha256sums_aarch64=('d08d6fc56009d775f2444149d05c8f710fa07e640a810628ab1ebc607c4f43c1')

package() {
  cd "clipsync-${pkgver}-linux-${CARCH}"
  install -Dm755 bin/clipsync "${pkgdir}/usr/bin/clipsync"
  install -Dm755 bin/clipsync-desktop "${pkgdir}/usr/bin/clipsync-desktop"
  install -Dm644 share/icons/hicolor/scalable/apps/clipsync.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/clipsync.svg"
  sed 's|^Exec=.*|Exec=clipsync-desktop|' share/applications/clipsync.desktop.in >clipsync.desktop
  install -Dm644 clipsync.desktop "${pkgdir}/usr/share/applications/clipsync.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
