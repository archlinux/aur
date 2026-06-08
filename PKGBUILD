_basepkgname=llamafile
pkgname=llamafile-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file"
arch=('x86_64')
url="https://github.com/mozilla-ai/llamafile"
license=('Apache-2.0')
optdepends=(
  'hip-runtime-amd: AMD GPU-Offloading Support'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existence of rocm'
  'cuda: Nvidia GPU-Offloading Support'
)
provides=('llamafile' 'whisperfile' 'zipalign')
conflicts=('llamafile-git' 'android-sdk-build-tools' 'zipalign')
options=('!strip')
source=("${pkgname}::${url}/releases/download/${pkgver}/llamafile-${pkgver}.zip")
sha256sums=('8ff91166a39bb9d387bf5f3115d02b4b2cbd93870f77eefd1d312e27dbf527f7')

package() {
  cd "${_basepkgname}-${pkgver}"

  # Install binaries
  install -Dm755 bin/whisperfile -t "${pkgdir}/usr/bin"
  install -Dm755 bin/llamafile -t "${pkgdir}/usr/bin"
  install -Dm755 bin/zipalign -t "${pkgdir}/usr/bin"

  # Install man pages
  install -Dm644 share/man/man1/zipalign.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 share/man/man1/whisperfile.1 -t "${pkgdir}/usr/share/man/man1"

  # Install documentation
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 README_0.10.0.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
