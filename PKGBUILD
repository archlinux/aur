# Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
# Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=9.5.0
pkgrel=1
_commit_id="2150b6cd1b23bd5f74c8e7be41e50efec78e3f73"
_builddir="cli-$pkgver-$pkgrel"
pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('2c97bf7e39880c72f4a0cbb6911b9ac381a4741f5fcc8c87707fa42437395ec9')
sha512sums=('17bbfe6077331e932770a9e0043540511614f5f6b1ad1fc0c01fc827317594cb60bf23a6dc95d09915a84ab7aa01045dd92e26a0fb938102a6e9b1611fcd1475')
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
