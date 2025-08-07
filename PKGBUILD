# Maintainer: Electria
pkgname=fish-helix-git
pkgver=r141.8a5c799
pkgrel=1
pkgdesc="helix key bindings for fish"
arch=(any)
url="https://github.com/sshilovsky/fish-helix"
license=('Unlicense')
depends=('fish')
makedepends=('git')
conflicts=('fish-helix')
provides=('fish-helix')

source=("git+https://github.com/sshilovsky/fish-helix#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd fish-helix
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/share/fish/functions"

    cp fish-helix/functions/fish_default_mode_prompt.fish "$pkgdir/usr/share/fish/functions/fish-helix_default_mode_prompt.fish"
    printf "\033[36;1mSince this package cannot overwrite the fish_default_mode_prompt owned by fish, instead use fish-helix_default_mode_prompt to exit helix mode\n"

    printf "You can enter helix mode normally, with fish_helix_key_bindings\033[0m\n"

    cp fish-helix/functions/fish_bind_count.fish "$pkgdir/usr/share/fish/functions"
    cp fish-helix/functions/fish_helix_command.fish "$pkgdir/usr/share/fish/functions"
    cp fish-helix/functions/fish_helix_key_bindings.fish "$pkgdir/usr/share/fish/functions"
}
