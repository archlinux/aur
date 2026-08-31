  # Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
  # Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
  # Github Contributor: ahmubashir <https://github.com/amubashir>

  pkgname=heroku-cli-bin
  pkgver=11.10.0
  pkgrel=1
  _commit_id="02429752e3afa026f109934517728b9fab227cd7"
  _builddir="cli-$pkgver-$pkgrel"
  pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
  arch=('any')
  url="https://devcenter.heroku.com/articles/heroku-cli"
  license=('custom' 'ISC')
  depends=('nodejs')
  optdepends=('git: Deploying to Heroku')
  conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
  source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
  sha256sums=('9b3e6007caad317b2510727436831a74f421dacc42ca71b0d48e659c77badfe3')
  sha512sums=('1fe4787613c2be9093eb713097ec1fb8e1c81b25d0173f491989cde7fe29d0a66bc26a268963f88fdcf87d2471226bc37894907df4eac8727aeb07d56ed92d58')
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
