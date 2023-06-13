# Maintainer: laeri laeri@laeri.me

pkgname=powernotd-bin
pkgver=1.1.0
pkgrel=4
pkgdesc="Battery level notification daemon for linux that sends events according to according to the 'Desktop Notification Specification'."
url="https://github.com/Laeri/powernotd"
license=("MIT")
arch=("x86_64")
provides=("powernotd")
conflicts=("powernotd")
source=("https://github.com/Laeri/powernotd/releases/download/v$pkgver/powernotd-$pkgver-x86_64.tar.gz")
sha256sums=("3a671bd826afa9ea7d035ea3730df6885916d85884eb36b53b60293e0289edbf")

package() {
    cd ./powernotd-${pkgver}-x86_64
    install -Dm755 powernotd -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    ## install man pages
    install -Dm644 man/powernotd.1 "$pkgdir/usr/share/man/man1/powernotd.1"

    ## install shell completions
    completion_dir_bash="$pkgdir/usr/share/bash-completion/completions/"
    if [[ -d $completion_dir_bash ]]; then
      install -Dm644 completions/powernotd.bash  "$completion_dir_bash/powernotd"
    fi

    completion_dir_zsh="$pkgdir/usr/share/zsh/site-functions/"
    if [[ -d $completion_dir_zsh ]]; then
      install -Dm644 completions/_powernotd       "$completion_dir_zsh" 
    fi

    completion_dir_fish="$pkgdir/usr/share/fish/completions/"
    if [[ -d $completion_dir_fish ]]; then
      install -Dm644 completions/powernotd.fish   "$completion_dir_fish"
    fi

    if [[ -d $completion_dir_elvish ]]; then
      completion_dir_elvish="$pkgdir/usr/share/elvish/completion"
      install -Dm644 completions/powernotd.elv   "$completion_dir_elvish" 
    fi
}
