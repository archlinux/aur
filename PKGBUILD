# Maintainer: eta <eta@theta.eu.org>
pkgname=sms-irc-git
pkgver=r138.e62a533
pkgrel=1
pkgdesc="A WhatsApp Web and SMS bridge for internet relay chat (IRC)."
arch=('x86_64')
url="https://git.theta.eu.org/sms-irc.git/about/"
license=('AGPL3')
depends=('postgresql-libs')
makedepends=('rust' 'cargo')
provides=('sms-irc')
conflicts=('sms-irc')
backup=('etc/sms-irc.conf')
optdepends=('inspircd: IRC server to bridge into')
options=()
changelog=
source=('git+https://git.theta.eu.org/sms-irc.git/')
md5sums=('SKIP')
noextract=()
_gitname="sms-irc"

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm644 config.example.toml "$pkgdir/etc/sms-irc.conf"
	cargo install --path . --root="$pkgdir/usr" --locked
	rm "$pkgdir/usr/.crates.toml"
}
