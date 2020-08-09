# Maintainer: amesgen <amesgen AT amesgen DOT de>
# Contributor: Rodrigo Gryzinski <rogryza@gmail.com>

pkgname='dhall-bin'
pkgver=1.34.0
pkgrel=2
pkgdesc="Dhall typechecker and formatter"
arch=('x86_64')
_repo='dhall-lang/dhall-haskell'
url="https://github.com/$_repo"
license=('BSD')
source=("dhall-$pkgver.tar.bz2::$url/releases/download/$pkgver/dhall-$pkgver-x86_64-linux.tar.bz2"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/$_repo/$pkgver/dhall/LICENSE"
        "dhall.1-$pkgver::https://raw.githubusercontent.com/$_repo/$pkgver/dhall/man/dhall.1")
sha256sums=('962c53b7b9f55f5155aa1f309b26e065a51b027bb7bfb16965439dbdde94c458'
            '91f68ca8606e7ae993148187e397e20431aa6d870ac9fcc70330a0479468eef9'
            'a41e5df44d67d9ea3dd4a64c85457f156d5266875046ea5de40adf1b3fc2a29f')

package() {
  install -Dm755 "$srcdir/bin/dhall" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 dhall.1-$pkgver "$pkgdir/usr/share/man/man1/dhall.1"

  _install_completion_script bash bash-completion/completions/dhall
  _install_completion_script zsh zsh/site-functions/_dhall
  _install_completion_script fish fish/vendor_completions.d/dhall.fish
}

_install_completion_script() {
  install -Dm644 <("$pkgdir/usr/bin/dhall" --$1-completion-script "/usr/bin/dhall") "$pkgdir/usr/share/$2"
}
