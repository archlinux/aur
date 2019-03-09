# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

_gitname=emoji-cli
pkgname=emoji-cli-git
pkgver=r40.ede4bfe
pkgrel=1
pkgdesc="Emoji completion on the command line for ZSH."
arch=('any')
url="https://github.com/b4b4r07/${_gitname}"
license=('MIT')
depends=('zsh' 
         'jq' 
         'fzf' 
         'peco')
makedepends=('git')
conflicts=('emoji-cli')
options=('!strip')
install="${pkgname}.install"
source=("git+${url}.git" 
        'LICENSE::http://b4b4r07.mit-license.org')
sha256sums=('SKIP'
	    'a807fb2b9b757b95938925e37370c6965e91d020e7afe79a35d15380b89fe889')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_gitname}/dict/emoji.json" "${pkgdir}/usr/share/zsh/plugins/${_gitname}/dict/emoji.json"
    install -Dm644 "${srcdir}/${_gitname}/emoji-cli"{.plugin,}".zsh" "${pkgdir}/usr/share/zsh/plugins/${_gitname}"
}
