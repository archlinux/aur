# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Vlad Petrov <ejiek@mail.ru>

pkgname=nb
pkgver=7.5.0
pkgrel=1
pkgdesc="A command line note-taking, bookmarking, archiving, and knowledge base application"
arch=('any')
url="https://github.com/xwmx/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
license=('AGPL3')
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
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # Completions
  install -Dm644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 etc/nb-completion.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  # Plugins
  install -Dm644 -t "${pkgdir}/usr/share/nb/plugins/" plugins/*
  # Extras (prefixed with "nb-")
  for extra in bookmark notes; do
    install -Dm0755 "bin/$extra" "${pkgdir}/usr/bin/${pkgname}-${extra}"
  done
}

sha256sums=(
  '15ebd54a0a18f810af519eeb29c11f332884ef33fa4b6218323f6cd5e83c5980'
)
sha512sums=(
  'd92cb15c9e787bdf8734b77d6c624f508b542a99cd3ef79a77ca3dbc0686e8688f4c457340709391b8dbe8f7b499a3b35dbe573eb3a58bcc4729fb46731212b9'
)
b2sums=(
  '67377f0652ee9c38f479898a5dd59beeb379ace05f20e52c2dc1dbe187bf6f4c5979bbc35e2a673242bc43d4e68f4657d6cbb9c8323c16de4c9ffb194037ab27'
)

# eof
