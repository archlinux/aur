# Maintainer: Zhanibek Adilbekov <zhnaibek.adilbekov@pm.me>
# Original Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=gibo
pkgver=2.2.5
pkgrel=1
pkgdesc="A shell script for easily accessing gitignore boilerplates"
url="https://github.com/simonwhitaker/gibo"
arch=('any')
install=$pkgname.install
license=('custom:UNLICENSE')
source=("https://github.com/simonwhitaker/$pkgname/archive/$pkgver.tar.gz"
    "$pkgname.install")
b2sums=('f4aa1248a6ab85b353733de1ca392a860f183181873779ae4a4cbb6d0774fd95bb449860e9537eece71db9c74e3772046ef16c37e11ea0600fa2c0830677f693'
        '7d1950d6ad1c2655f90945607825c90488269e5095b512ede18d54ab64659a35df99614649ac9a023577d8f12de2b5093c3cda1add2c523fdda23f1dd61b3e9b')

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
