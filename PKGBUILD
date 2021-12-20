# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

_pkgname='nb'
pkgname="${_pkgname}-snapshot"
pkgver=6.7.9
pkgrel=1
pkgdesc='A command line note-taking, bookmarking, archiving, and knowledge base application (snapshot)'
arch=('any')
url="https://github.com/xwmx/${_pkgname}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
license=('AGPL3')
depends=(
  'bash'
  'git'
)
optdepends=(
  'ack'
  'bat'
  'exa'
  'ffmpeg'
  'lynx'
  'pandoc'
  'readability-cli'
  'ripgrep'
  'the_silver_searcher'
  'tig'
  'w3m'
)
provides=("$_pkgname")
conflicts=(
  "$_pkgname"{,-git}
)
sha256sums=(
  '4ba6926c575844843d575441775492ea86356e65edea353e2683ef687b483647'
)
sha512sums=(
  '310e3043fd0ed9dd5f792bf830320b09059db833514264cfae6716625e3262416ea5d0660f1703d2152a883364f9f34a70354efe17befd419e8976770802e821'
)
b2sums=(
  'a405832f02638ce7e59d2249f7f1a7b5ea4a310f2da97725c4123deffa1973b89cf5437ad1992c52f6e3374f4b3c9ed677105bd358c892c6ec4a487d29d98b84'
)

package() {
  cd "${_pkgname}-${pkgver}" || exit 1

  install -Dm0755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  for extra in bookmark notes; do
    install -Dm0755 "bin/$extra" "${pkgdir}/usr/bin/${_pkgname}-${extra}"
  done

  for extra in plugins/*.nb-{plugin,theme}; do
    install -Dm0755 "$extra" "${pkgdir}/usr/share/$_pkgname/${extra##*/}"
  done

  install -Dm0644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm0644 etc/nb-completion.zsh  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# eof
