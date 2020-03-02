# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=nushell-stable-git
pkgver=0.10.0.r13.ged7d3fed
pkgrel=1
pkgdesc='A new type of shell.'
url='https://www.nushell.sh'
license=('MIT')
makedepends=('rust' 'git')
depends=('openssl')
optdepends=('libxcb' 'libx11')
arch=('x86_64')
install='nushell-stable-git.install'
source=('nushell::git://github.com/nushell/nushell.git')
sha256sums=('SKIP')

pkgver() {
  cd "nushell"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "nushell"

  cargo install \
    --locked \
    --path . \
    --features stable \
    --root "${pkgdir}"/usr

  rm -f "${pkgdir}"/usr/.crate*
}
