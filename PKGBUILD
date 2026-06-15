# Maintainer: Aidan McConnon <aidanmcconnon210@gmail.com>
# AUR "-bin" package: repackages the prebuilt .deb from GitHub Releases (no
# compile). Bump pkgver + sha256sums on each release, regenerate .SRCINFO
# (`makepkg --printsrcinfo > .SRCINFO`), and push to the AUR git remote.
pkgname=cortex-bin
pkgver=1.0.2
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
sha256sums=('43bc76fdf46be3060979ed696cc4f8d3e514d6f35ce484aae20a07d267003d61')

package() {
  # A .deb is an `ar` archive containing data.tar.* with the install tree.
  cd "$srcdir"
  bsdtar -xf "Cortex_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "$pkgdir"
}
