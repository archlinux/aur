# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Vlad Petrov <ejiek@mail.ru>
# -*- sh -*-

pkgname=nb
pkgver=7.10.1
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
  'exa'
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

sha256sums=(
  '0d37414563fdb743a6ae5052940b9dcbfc60420807f3888b7f089afea2e8e962'
)
b2sums=(
  'f703f03e9b1fadbe88cbc16c29a2db61ce9351c43179e371fcdae78c240d167b8091193b2bd1cc59b02563c4d5abded063319d847397f4b9f5f009265cc861f7'
)

# eof
