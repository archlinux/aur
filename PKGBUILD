# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=emoji-cli
pkgver=r42.26e2d67
pkgrel=1
pkgdesc="Emoji completion on the command line for ZSH."
arch=('any')
url="https://github.com/b4b4r07/${pkgname}"
license=('MIT')
depends=('zsh' 
         'jq' 
         'fzf')
makedepends=('git')
options=('!strip')
install="emoji-cli.install"
source=("git+${url}.git" 
        'LICENCE::http://b4b4r07.mit-license.org')
sha256sums=('SKIP'
            '2a7432c70fd0114ee823e94731aec411751c4a7a6728b9841072272bc1270dad')

pkgver(){
    cd ${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/"
    install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

    cd "$srcdir/$pkgname"
    install -Dm 644 "dict/emoji.json" "${pkgdir}/usr/share/zsh/plugins/${pkgname}/dict/emoji.json"
    install -Dm 644 "emoji-cli"{.plugin,}".zsh" "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
}
