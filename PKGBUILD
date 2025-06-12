# Maintainer: gilcu3
# Previous Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Vlad Petrov <ejiek@mail.ru>
# -*- sh -*-

pkgname='nb'
pkgver=7.20.0
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

sha256sums=('7d677e88ebeb64f9f94a78e0b08cc4d60146bdf2f591fcd6bf31f832eba55e08')
b2sums=('941bd3ac59d167d324d7b6b80d3d9cc85f655a68e90adc4240382841f16e4c22ebfc992ee46a484b9f9266dc777884bf2907b37159c21a9c9f77a55cf9edb033')

# eof
