# Maintainer: Chaos-Tic <58691435+Chaos-Tic@users.noreply.github.com>
# Built by packaging/linux/build-package.sh arch, which sets pkgver from
# Cargo.toml. For the AUR, replace SKIP with the release tarball's checksum.
pkgname=lorenz
pkgver=1.2.0
pkgrel=1
pkgdesc='Local file conversion with radial wheels'
arch=('x86_64')
url='https://github.com/Chaos-Tic/Lorenz'
license=('GPL-3.0-or-later')
depends=('qt6-base' 'gcc-libs' 'glibc')
makedepends=('cargo' 'cmake')
optdepends=(
    'ffmpeg: video and audio'
    'imagemagick: images'
    'pandoc-cli: documents'
    'poppler: PDF text and pages'
    'qpdf: merge and split PDF'
    'ghostscript: compress PDF'
    'libarchive: archives'
    'libreoffice-fresh: Word, PowerPoint and spreadsheet files'
    'libnotify: notifications'
    'wl-clipboard: copy files on Wayland'
    'xclip: copy files on X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db05818f3f05d985fe97ff8b96e7ff223fdb1635de1247352b3ac8073f6e0c85')

build() {
    cd "Lorenz-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    cd "Lorenz-$pkgver"
    DESTDIR="$pkgdir" cmake --install build --prefix /usr --strip
}
