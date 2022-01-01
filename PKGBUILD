# Maintainer: lafruit <toxyxd@riseup.net> 
# Contributor: Simon Hauser <Simon-Hauser@outlook.de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='spotify-tui-bin'
pkgver=0.25.0
pkgrel=3
pkgdesc="Spotify client for the terminal written in Rust"
arch=('x86_64')
url='https://github.com/Rigellute/spotify-tui'
license=('MIT')
depends=(openssl libxcb)
provides=('spotify-tui')
conflicts=('spotify-tui')

source=("spotify-tui-linux-$pkgver.tar.gz::$url/releases/download/v$pkgver/spotify-tui-linux.tar.gz"
        "https://raw.githubusercontent.com/Rigellute/spotify-tui/v$pkgver/LICENSE")
sha256sums=('3fa282ac4fb4c4555ef05baeec99ca4fe0dbcfe42f5a7c3bea12f6893b88d1e0'
            'fff3d1c3cc96e7dd3e2b80727fbe572b2cedf2e8c8dfec95f2fe200b09224dad')

function package {
    install -Dt "$pkgdir/usr/bin/" "$srcdir/spt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    $srcdir/spt --completions bash > $srcdir/spt-completion.bash
    install -Dm 644 $srcdir/spt-completion.bash "$pkgdir"/usr/share/bash-completion/completions/spt

    $srcdir/spt --completions zsh > $srcdir/spt-completion.zsh
    install -Dm 644 $srcdir/spt-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_spt

    $srcdir/spt --completions fish > $srcdir/spt-completion.fish
    install -Dm 644 $srcdir/spt-completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/spt.fish
}
