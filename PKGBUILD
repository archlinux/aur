# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@pm.me>
# Original Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gibo
pkgver=2.2.7
pkgrel=1
pkgdesc="A shell script for easily accessing gitignore boilerplates"
url="https://github.com/simonwhitaker/gibo"
arch=('any')
install=$pkgname.install
license=('custom:UNLICENSE')
source=("https://github.com/simonwhitaker/$pkgname/archive/$pkgver.tar.gz"
    "$pkgname.install")
b2sums=('924bd6238ac28f830f095f1ef5b6d10f264248c276ef3a8028170d470643cdcc569a8480b850f475bae43e6c8923b2b970a918801827690c8e01504857001193'
        'a8516b43198e9353eaf0fe49d50cb50ea2ac096b0366deabd33795b2c6d52ede6264d5615acdf78117550dbd2dc13999bca66fc9d1b10a090e7cee344c487f97')

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

    # license
    install -Dm644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE

    # bash
    mkdir -p $pkgdir/usr/share/bash-completion
    install -Dm644 ./shell-completions/$pkgname-completion.bash $pkgdir/usr/share/bash-completion/completions/$pkgname

    # zsh
    mkdir -p $pkgdir/usr/share/zsh/site-functions
    install -Dm644 ./shell-completions/$pkgname-completion.zsh $pkgdir/usr/share/zsh/site-functions/_$pkgname

    # fish
    mkdir -p $pkgdir/usr/share/fish/completions
    install -Dm644 ./shell-completions/$pkgname.fish $pkgdir/usr/share/fish/completions/$pkgname.fish
}
