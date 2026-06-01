pkgname=lmms-lab-writer-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="AI-native LaTeX editor desktop application (prebuilt binary)"
arch=('x86_64')
url="https://github.com/EvolvingLMMs-Lab/lmms-lab-writer"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'opencode' 'texlive-bin' 'texlive-binextra' 'texlive-latex' 'texlive-latexrecommended' 'texlive-latexextra' 'texlive-fontsrecommended' 'texlive-langcjk')
provides=('lmms-lab-writer')
conflicts=('lmms-lab-writer')
options=(!strip)
source_x86_64=("lmms-lab-writer_0.1.3_amd64.deb::https://github.com/EvolvingLMMs-Lab/lmms-lab-writer/releases/download/v0.1.3/LMMs-Lab.Writer_0.1.3_amd64.deb")
sha256sums_x86_64=('f67e355cea0c149a9c7c741e0f40b3b5f7b7845f0566a17b16cc6ac1b51fc71a')

package() {
  local workdir data_archive
  workdir="${srcdir}/deb-extract"
  rm -rf "${workdir}"
  mkdir -p "${workdir}"

  bsdtar -xf "${srcdir}/lmms-lab-writer_0.1.3_amd64.deb" -C "${workdir}"
  data_archive="$(find "${workdir}" -maxdepth 1 -type f -name 'data.tar.*' | head -n 1)"
  if [[ -z "${data_archive}" ]]; then
    echo "data.tar.* not found in lmms-lab-writer_0.1.3_amd64.deb" >&2
    return 1
  fi

  bsdtar -xf "${data_archive}" -C "${pkgdir}"
}
