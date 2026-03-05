  # Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
  # Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
  # Github Contributor: ahmubashir <https://github.com/amubashir>

  pkgname=heroku-cli-bin
  pkgver=10.17.0
  pkgrel=1
  _commit_id="2cbe69fc69903c3f194c33357a1217c4682d6357"
  _builddir="cli-$pkgver-$pkgrel"
  pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
  arch=('any')
  url="https://devcenter.heroku.com/articles/heroku-cli"
  license=('custom' 'ISC')
  depends=('nodejs')
  optdepends=('git: Deploying to Heroku')
  conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
  source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
  sha256sums=('32a46b28698123fb6f2246ef42a87166596cc05435d711573246d4d97a2c55ac')
  sha512sums=('9b8de92a66979b671a1cdcb7e02987ac07b295b189fa79745c16b531d383d644035b83c852c0fe7e7f0c49c9768634981d2f7b30eb564776c8cc758a18bfc9c1')
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
