# Maintainer: Xuepoo
# This file is a shared template for both `vem` and `vem-bin` (identical
# binary-repackage approach — there's no separate from-source build yet, so
# `vem-bin` exists purely for AUR naming-convention discoverability).
# CI (.github/workflows/release.yml, publish-aur job) substitutes
# vem-bin / 0.1.1 / https://github.com/vemjs/vem-desktop/releases/download/v0.1.1/Vem_0.1.1_amd64.deb / https://github.com/vemjs/vem-desktop/releases/download/v0.1.1/Vem_0.1.1_arm64.deb and writes the
# result to PKGBUILD before running updpkgsums + makepkg --printsrcinfo.
# Don't hand-edit a generated PKGBUILD in the AUR checkout; edit this
# template and cut a new release.
pkgname=vem-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A next-generation Vim editor powered by VectoJS, running natively via Tauri"
arch=('x86_64' 'aarch64')
url="https://vem.run"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
provides=('vem')
conflicts=('vem' 'vem-bin')
options=('!strip')
source_x86_64=("vem-${pkgver}-x86_64.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.1/Vem_0.1.1_amd64.deb")
source_aarch64=("vem-${pkgver}-aarch64.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.1/Vem_0.1.1_arm64.deb")
sha256sums_x86_64=('a0f9f2812620354b710facfcc3de68836cd650ff62d8c0bfdb7edbe6d334f0d9')
sha256sums_aarch64=('790dcef81583528694569d740820232deb434c9bd43d2d036399a04ffc7fd3d2')

package() {
  case "$CARCH" in
    x86_64) _debfile="vem-${pkgver}-x86_64.deb" ;;
    aarch64) _debfile="vem-${pkgver}-aarch64.deb" ;;
  esac
  bsdtar -xf "${srcdir}/${_debfile}" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
