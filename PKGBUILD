  # Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
  # Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
  # Github Contributor: ahmubashir <https://github.com/amubashir>

  pkgname=heroku-cli-bin
  pkgver=10.16.0
  pkgrel=1
  _commit_id="12f62c59d39381ca82e59d7a316e184a235cce38"
  _builddir="cli-$pkgver-$pkgrel"
  pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
  arch=('any')
  url="https://devcenter.heroku.com/articles/heroku-cli"
  license=('custom' 'ISC')
  depends=('nodejs')
  optdepends=('git: Deploying to Heroku')
  conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
  source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
  sha256sums=('fc58d4cabac8e594574c26d7621aa1541967010d2b884152e967c40b63349098')
  sha512sums=('c231be810b8b07f557a7da7abf5a1164a94609f134bc6c3eaaa231cfb6f7fe491fd12a4f26041e023e4339425615361b40663ec5231d5d5116ed0fcbc5e8d7c8')
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
