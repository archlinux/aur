# Maintainer: Chloe Colman <chloe.colman7@gmail.com> 
# Contributor: Sampson Crowley <sampsonsprojects@gmail.com>
# Github Contributor: ahmubashir <https://github.com/amubashir>

pkgname=heroku-cli-bin
pkgver=8.2.0
pkgrel=1
_commit_id="5530a9a217340187d93d89bc09a44514cf520769"
_builddir="cli-$pkgver-$pkgrel"
pkgdesc="CLI to Manage Heroku apps with forced auto-update removed. Packaged before release to save time and bandwidth."
arch=('any')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
depends=('nodejs')
optdepends=('git: Deploying to Heroku')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source=("https://github.com/ChloeColman/heroku-cli-bin/raw/${_commit_id}/heroku-cli-bin-v$pkgver-$pkgrel.tar.xz")
sha256sums=('622105d9ffc019624254295f9e85509efad7ef55c9e88eaed46c1b77560131f0')
sha512sums=('51a2d41cc801c81dbde292fb51f4bd3a60c9b1ab3a0bdbd26b0b711fd644bc9bbd1d9e8cd43f843c07be4d57db4841f7e6efd8bf64ca0aaad25458c73c0cf0db')
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
