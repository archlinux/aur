  # Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
  # Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
  # Github Contributor: ahmubashir <https://github.com/amubashir>

  pkgname=heroku-cli-bin
  pkgver=11.14.0
  pkgrel=1
  _commit_id="3af2af0507e3fe11efbfc0cfa66a13a6f2ef3de0"
  _builddir="cli-$pkgver-$pkgrel"
  pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
  arch=('any')
  url="https://devcenter.heroku.com/articles/heroku-cli"
  license=('custom' 'ISC')
  depends=('nodejs')
  optdepends=('git: Deploying to Heroku')
  conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
  source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
  sha256sums=('a85321aea4a86c7e36a18b1e8ce961f60cfec5463dcd577326f28655640ab29e')
  sha512sums=('45e2243add858c717b26c2b0d4bdbec201c979742d94dad7dd472144b793376787695c7744fb97e1b0e38438b0efdd8727c5503a962223ef8df191478596a153')
  options=('!strip')
  provides=('heroku' 'heroku-cli')

  package() {
    install -dm755 "$pkgdir/usr/lib/heroku"
    install -dm755 "$pkgdir/usr/bin" 
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

    cp -a "$srcdir/heroku" "$pkgdir/usr/lib"

    # completions
    local autocompletedir="$srcdir/heroku/autocomplete-scripts"
    install -Dm644 "$autocompletedir/bash/heroku.bash" "$pkgdir/usr/share/bash-completion/completions/heroku"
    install -Dm644 "$autocompletedir/zsh/_heroku" "$pkgdir/usr/share/zsh/site-functions/_heroku"

    ln -sf "../../../lib/heroku/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
    ln -sf "../../lib/heroku/bin/run" "$pkgdir/usr/bin/heroku"

    # Remove empty directories
    find "${pkgdir}" -type d -empty -delete
  }
