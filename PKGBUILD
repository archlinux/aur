# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=nb-git
_gitname=nb
pkgver=5.7.8.r657.gaa244add
pkgrel=1
pkgdesc="A command line note-taking, bookmarking, archiving, and knowledge base application - Git version"
arch=('any')
url="https://github.com/xwmx/${_gitname}"
source=("git+https://github.com/xwmx/$_gitname.git")
license=('AGPL3')
depends=('bash' 'git')
optdepends=('ack'
            'bat'
            'exa'
            'ffmpeg'
            'lynx'
            'pandoc: to convert HTML bookmarks to markdown'
            'readability-cli: to cleanup HTML markup'
            'ripgrep'
            'the_silver_searcher'
            'tig'
            'w3m')
provides=('nb')
conflicts=('nb')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitname}"

	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_gitname}"

  install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # setup completions
  install -dm 755 "${pkgdir}/usr/share/bash-completion/completions" \
                  "${pkgdir}/usr/share/zsh/site-functions" \

  install -D -m644 etc/nb-completion.bash "${pkgdir}/usr/share/bash-completion/completions/${_gitname}"
  install -D -m644 etc/nb-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_gitname}"

}

# vim:set ts=2 sw=2 et:
