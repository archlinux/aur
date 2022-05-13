# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname='ormolu-bin'
pkgver=0.5.0.0
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('x86_64')
url='https://github.com/tweag/ormolu'
license=('BSD')
provides=('ormolu')
conflicts=('ormolu' 'haskell-ormolu')

source=("ormolu-$pkgver.zip::https://github.com/tweag/ormolu/releases/download/$pkgver/ormolu-Linux.zip"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/tweag/ormolu/$pkgver/LICENSE.md")
sha256sums=('e97eafeeb90d15d76d7700245ded5ebefe9774bd15ada309dca6e12de9b65a66'
            '6572a825b43b87cf53d197723e1d64ce78535fe8bfa19b1377be582909b81141')

package() {
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 "$srcdir/ormolu" -t "$pkgdir/usr/bin/"
  _install_completion_script bash bash-completion/completions/ormolu
  _install_completion_script zsh zsh/site-functions/_ormolu
  _install_completion_script fish fish/vendor_completions.d/ormolu.fish
}

_install_completion_script() {
  install -Dm644 <("$pkgdir/usr/bin/ormolu" --$1-completion-script /usr/bin/ormolu) "$pkgdir/usr/share/$2"
}
