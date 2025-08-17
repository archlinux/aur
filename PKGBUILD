# Maintainer: bashuser30 <bashuser30@mailbox.org>
pkgname=dl-distro-git
_pkgname=dl-distro
pkgver=421.7406427
pkgrel=1
pkgdesc="Bash script for downloading and verifying OS images."
arch=('any')
url="https://codeberg.org/bashuser30/$_pkgname"
license=('GPL-3.0-or-later')
depends=('bash'
         'coreutils'
         'jq'
         'wget')
makedepends=('git')
optdepends=('gnupg'
            'minisign: Void Linux verification'
            'signify: OpenBSD verification')
provides=('dl-distro')
conflicts=('dl-distro')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 "man/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
	install -Dm644 "completions/bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
}
