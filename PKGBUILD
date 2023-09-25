# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=arcanist
pkgver=2022.21
_commit=b6babd9a07f428c68863cb38f2fa87114e9ca2eb
pkgrel=1
pkgdesc='The command line interface for Phabricator'
arch=('any')
url="https://www.phacility.com/phabricator/"
license=('Apache')
depends=('php' 'python' 'ca-certificates-utils')
optdepends=('git: Git VCS support'
            'subversion: Subversion VCS support'
            'mercurial: Mercurial VCS support')
makedepends=('git')
source=("git+https://github.com/phacility/arcanist.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/php/$pkgname/" "$pkgdir/usr/bin/"
  cp -a $pkgname/* "$pkgdir/usr/share/php/$pkgname/"
  install -Dm644 $pkgname/support/shell/hooks/bash-completion.sh "$pkgdir/usr/share/bash-completion/completions/arc"
  ln -s ../share/php/$pkgname/bin/arc "$pkgdir/usr/bin/arc"
  ln -sf ../../../../../../etc/ssl/cert.pem "$pkgdir/usr/share/php/arcanist/resources/ssl/default.pem"
}
