  # Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
  # Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
  # Github Contributor: ahmubashir <https://github.com/amubashir>

  pkgname=heroku-cli-bin
  pkgver=10.15.1
  pkgrel=1
  _commit_id="c2548d9b8bf650bb16b459ba76f1f747e293a6cd"
  _builddir="cli-$pkgver-$pkgrel"
  pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
  arch=('any')
  url="https://devcenter.heroku.com/articles/heroku-cli"
  license=('custom' 'ISC')
  depends=('nodejs')
  optdepends=('git: Deploying to Heroku')
  conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
  source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
  sha256sums=('4d33efe770116110ed83a0b3e719e88ba04771b08c4ea6a91dfcebe6c0ba9ebc')
  sha512sums=('e2848f1198d5a2266cc4db9c02a3003d7931eece48252bafd74d2e6bfa9e789eefd4ab9e19b07d6c4eee57014ae341fcea342ee92b079a6b39a6382533025dbc')
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
