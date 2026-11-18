# Maintainer: Theluga <theluga.official@gmail.com>

pkgname=dummypkg-git
pkgver=r18.g85eb59b
pkgrel=1
pkgdesc="A utility to generate and install dummy packages in pacman"
arch=('any')
url="https://github.com/Theluga/dummypkg"
license=('GPL-3.0-or-later')

depends=('bash' 'pacman')

optdepends=(
	'sudo: privilege escalation'
	'doas: privilege escalation'
	'systemd: run0 privilege escalation'
)

makedepends=('git')

provides=("dummypkg=${pkgver}")
conflicts=('dummypkg')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/dummypkg"

	printf "r%s.g%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 \
		"$srcdir/dummypkg/dummypkg" \
		"$pkgdir/usr/bin/dummypkg"
}

