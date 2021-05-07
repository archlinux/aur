# Maintainer : Yamada Hayao <development@fascode.net>

_pkgname=just
_reponame="${_pkgname}-js"
pkgname="${_reponame}-completion"
pkgver="0.0.22"
pkgrel="1"
pkgdesc='Shell completion for just-js'
arch=('x86_64' "i686")
url='https://github.com/just-js/just'

depends=("just-js")

dirname="${_pkgname}-${pkgver}"
zsh_completions_dir="/usr/share/zsh/site-functions"
bash_completions_dir="/usr/share/bash-completion/completions"
fish_completions_dir="/usr/share/fish/vendor_completions.d"


_just(){
    "/usr/bin/just" "${@}"
}

package() {
    cd "${srcdir}/${dirname}"

    # install zsh completions
    install -dm755 "${pkgdir}/${zsh_completions_dir}"
    _just --completions zsh > "${pkgdir}/${zsh_completions_dir}/_justjs"

    # install bash completions
    install -dm755 "${pkgdir}/${bash_completions_dir}"
    _just --completions bash > "${pkgdir}/${bash_completions_dir}/justjs"

    # install fish completions
    install -dm755 "${pkgdir}/${fish_completions_dir}"
    _just --completions fish > "${pkgdir}/${fish_completions_dir}/justjs"
}
