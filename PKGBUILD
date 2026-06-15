# Maintainer: Aidan McConnon <aidanmcconnon210@gmail.com>
# AUR "-bin" package: repackages the prebuilt .deb from GitHub Releases (no
# compile). Bump pkgver + sha256sums on each release, regenerate .SRCINFO
# (`makepkg --printsrcinfo > .SRCINFO`), and push to the AUR git remote.
pkgname=cortex-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Local-first, open-source NotebookLM alternative — a desktop study OS"
arch=('x86_64')
url="https://github.com/PndaMan/cortex"
license=('Apache-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=(
  'mpv: background study music'
  'ffmpeg: audio processing for recordings'
  'libreoffice-fresh: rendered PPTX/DOCX slide previews (text ingest works without it)'
  'poppler: faster, cleaner PDF text extraction'
  'ollama: local, keyless LLM + embeddings'
)
provides=('cortex')
conflicts=('cortex')
source=("https://github.com/PndaMan/cortex/releases/download/v${pkgver}/Cortex_${pkgver}_amd64.deb")
sha256sums=('520c5628804dd91c93b9a960bd14a6e055e4e189917bd9876bdc01277a129424')

package() {
  # A .deb is an `ar` archive containing data.tar.* with the install tree.
  cd "$srcdir"
  bsdtar -xf "Cortex_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
