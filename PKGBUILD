# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=himitsu-ssh-git
_pkgname=${pkgname%-git}
pkgver=r45.3e1d901
pkgrel=1
pkgdesc='SSH integration for Himitsu'
url='https://sr.ht/~sircmpwn/himitsu-ssh'
license=(GPL-3.0)
arch=(x86_64 aarch64)
depends=()
makedepends=(hare hare-ssh)
conflicts=(himitsu-ssh)
provides=(himitsu-ssh)
source=("git+https://git.sr.ht/~sircmpwn/himitsu-ssh"
	"hissh-agent.service")
sha256sums=('SKIP'
	'cff7c70946d9d06f06588e3a3b8c833eb67204a7c936f3f77ee3c8b18974a2ff')


pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 "$srcdir"/hissh-agent.service \
                "$pkgdir/usr/lib/systemd/user/hissh-agent.service"
}
