# Maintainer: Kamil Śliwak <cameel2@gmail.com>

pkgname=ansible-completion-git
pkgver=r67.40053ed
pkgrel=1
pkgdesc='Basic bash completion for Ansible'
arch=('any')
url="https://github.com/dysosmus/ansible-completion"
license=('GPL3')
depends=('bash-completion' 'ansible')
makedepends=('git')
provides=('ansible-completion')
conflicts=('ansible-completion')
source=("$pkgname"::git+${url}.git)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"

    # TODO: Right now there are no tags in the git repo.
    # Change the command below to use tags when the first official version gets released.
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"

    mkdir --parents "${pkgdir}/usr/share/bash-completion/completions/"
    for file in *-completion.bash; do
        # Completion files are loaded on demand and their names must match command names.
        # We have to strip the `-completion.bash` suffix to get the command name.
        command_name=${file/-completion.bash/}

        install -Dm644 "${file}" "${pkgdir}/usr/share/bash-completion/completions/${command_name}"
    done
}
