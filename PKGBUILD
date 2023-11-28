# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=himitsu-git
_pkgname=${pkgname%-git}
pkgver=r157.c657d70
pkgrel=1
pkgdesc='Himitsu is a secret storage system for Unix systems'
url='https://sr.ht/~sircmpwn/himitsu'
license=(GPL-3.0)
arch=(x86_64 aarch64)
depends=()
makedepends=(hare-git scdoc)
optdepends=('hiprompt-gtk-py: prompter support (GTK+)')
conflicts=()
provides=(himitsu)
source=(
	"git+https://git.sr.ht/~sircmpwn/himitsu"
	"himitsud.service"
)
sha256sums=('SKIP'
            '0d84a1ceb17b6be53066f9f617ee35f233ada2283c3f9b3cbea5f2c8b6c7001e')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir"/himitsud.service \
		"$pkgdir/usr/lib/systemd/user/himitsud.service"
}
