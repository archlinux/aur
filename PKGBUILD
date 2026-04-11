# Maintainer: Thomas Ramfjord <your-email@example.com>
pkgname=lem
# Using nightly build since stable releases don't have precompiled binaries
pkgver=nightly.$(date +%Y%m%d)
pkgrel=1
pkgdesc="A Lisp-based text editor for the modern world"
arch=('x86_64')
url="https://github.com/lem-project/lem"
license=('MIT')
depends=('fuse2')  # Required for AppImage
makedepends=()
optdepends=()
provides=('lem')
conflicts=('lem-git')
source=("lem-appimage::https://github.com/lem-project/lem/releases/download/nightly-latest/Lem-x86_64.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "lem-appimage"
}

package() {
    install -Dm755 "lem-appimage" "${pkgdir}/usr/bin/lem"

    # Create a symlink for consistency
    ln -sf /usr/bin/lem "${pkgdir}/usr/bin/lem-editor" || true
}
