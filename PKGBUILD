# Maintainer: gilcu3
# Previous Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Vlad Petrov <ejiek@mail.ru>
# -*- sh -*-

pkgname='nb'
pkgver=7.23.2
pkgrel=1
pkgdesc="A command-line note-taking, bookmarking, archiving, and knowledge base application"
arch=('any')
url="https://github.com/xwmx/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=('bash' 'git')
optdepends=(
  # Recommended
  'bat: recommended'
  'nmap: for ncat, recommended' # For ncat
  'pandoc: recommended'
  'ripgrep: recommended'
  'tig: recommended'
  'w3m: recommended'
  # Additional
  'ack'
  'the_silver_searcher'
  'catimg'
  'eza'
  'ffmpeg' # For ffplay
  'imagemagick'
  'glow'
  'gnupg'
  'highlight'
  'links'
  'lynx'
  'mc'
  'mpg123'
  'mplayer'
  'poppler' # For pdftotext
  'python-pygments'
  'ranger'
  'readability-cli'
  'ripgrep-all'
  'termpdf.py-git'
  'vifm'
)

package() {
  cd "${pkgname}-${pkgver}"

  # Be more verbose if standard output is a TTY
  test -t 1 && _v='v' || _v=''

  install -${_v}Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -${_v}Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -${_v}Dm0644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"

  # Completions
  install -${_v}Dm0644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -${_v}Dm0644 etc/nb-completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -${_v}Dm0644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  # Plugins
  install -${_v}Dm0644 -t "${pkgdir}/usr/share/nb/plugins/" plugins/*

  # Extras (prefixed with "nb-")
  for _extra in bookmark notes; do
    install -${_v}Dm0755 "bin/$_extra" "${pkgdir}/usr/bin/${pkgname}-${_extra}"
  done
}

sha256sums=('4b24b19e11d280c3fa7c8a2a21dda366934d2b277d30a3d26c6de3ed01097877')
b2sums=('1d765a3b99d0b3132bff183a4a8e2065ffe90a3175990286f024f8bf85748c1a38481ff2bd6be2975c3244df10e9cabbad0c12a014fc689c5cb9285a9d9d3317')

# eof
