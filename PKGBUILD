# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: Vlad Petrov <ejiek@mail.ru>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=nb
pkgver=6.8.1
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
sha512sums=('503e6151cc55a5d4d149d30c3387b7c85488d1dcb267271e6868dc2e2ce461c1f63128f95db4d5b7543cecbdaf78628ada7f16ea94036ff920e8516a520c9044')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  # Completions
  install -Dm644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  # Plugins
  install -Dm644 -t "${pkgdir}/usr/share/nb/plugins/" plugins/*
  # Extras (prefixed with "nb-")
  for extra in bookmark notes; do
    install -Dm0755 "bin/$extra" "${pkgdir}/usr/bin/${pkgname}-${extra}"
  done
}
