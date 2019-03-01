# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='codimd-cli'
pkgname=${_pkgbase}-git
pkgver=r34.063634d
pkgrel=1
pkgdesc="A tiny CLI to perform common operations on CodiMD (formerly known as HackMD)."
arch=('any')
url='https://github.com/hackmdio/codimd-cli'
license=('AGPL3')
provides=('codimd-cli')
conflicts=('codimd-cli')
depends=('bash' 'curl' 'jq' 'wget')
makedepends=('git')
source=("$_pkgbase::git+https://github.com/hackmdio/codimd-cli.git")

pkgver() {
  cd "$_pkgbase"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgbase"

  install -m755 -d "$pkgdir/usr/bin"
  install -Dm755 "bin/codimd" "$pkgdir/usr/bin"
  ln -s /usr/bin/codimd "$pkgdir/usr/bin/hackmd"
}

sha256sums=('SKIP')
