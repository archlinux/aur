# Maintainer: bashuser30 <bashuser30 at mailbox dot org>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=159.f588bf3
pkgrel=1
pkgdesc="Download and verify Linux ISOs with GnuPG and shasums"
arch=('any')
url="https://codeberg.org/bashuser30/$_pkgname"
source=("git+$url")
license=('GPL3')
depends=('bash' 'coreutils' 'jq' 'wget')
optdepends=('gnupg'
            'minisign: Void Linux verification')
makedepends=('git')
conflicts=('dl-distro')
provides=('dl-distro')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 distro_data.json "$pkgdir/usr/share/$_pkgname/distro_data.json"
}
