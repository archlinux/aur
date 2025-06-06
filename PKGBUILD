# Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
# Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=10.10.0
pkgrel=1
_commit_id="4285aea68be8e47c64bb70462e96b031a84b26ad"
_builddir="cli-$pkgver-$pkgrel"
pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('200e67572a31da261edf31c4d543e7f5b49bf3a91cb4e81663721e00ae1fc375')
sha512sums=('954376621430cad6b0dd3c4a488695a3a3135217c96a153e963cc1c08b8cb541a981d36ebca4030e45bc017388bc329ad9b0bb4925bf77d7cec6ee8cb222ee75')
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
