# Maintainer: vojket <vojket+aur@protonmail.com>
# Contributor: xiretza <xiretza+aur@gmail.com>
pkgname=factorio-init
pkgver=3.1.0
pkgrel=1
pkgdesc="A factorio init script in bash"
arch=('any')
url="https://github.com/Bisa/factorio-init"
license=('MIT')
depends=('bash'
		 'curl'
		 'wget')
optdepends=('bash-completion: autocompletion support')
backup=("etc/factorio-init.conf")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Bisa/factorio-init/archive/$pkgver.tar.gz"
		"factorio-init.conf"
		"factorio-init.service")
sha256sums=('32b51b118b0ea21bd883d2afa73db0b2ff5b744edf4951af78cc77213dfd3403'
            'e79742ae05e027bb00ab2e86a7d005b172a72f593c9cf54dbd00d4f789b464c4'
            'dfff03f3798c8a6a7d55271483856320d1feb4831679172905d93ed4aed89dd3')

package() {
	cd "$srcdir"

	_instdir="$pkgdir/usr/share/$pkgname"
	_upstream="$srcdir/$pkgname-$pkgver"

	# Install and symlink bash script
	install -Dm655 "$_upstream/factorio" "$_instdir/factorio-init"
	install -d "$pkgdir/usr/bin/"
	ln -s "/usr/share/factorio-init/factorio-init" "$pkgdir/usr/bin/factorio-init"

	# Install and symlink config file
	install -Dm644 factorio-init.conf "$pkgdir/etc/factorio-init.conf"
	ln -s "/etc/factorio-init.conf" "$_instdir/config"

	# Install bash autocompletions
	install -Dm644 "$_upstream/extras/bash_autocomplete" "$pkgdir/usr/share/bash-completion/completions/factorio-init/bash_autocomplete"

	# Install systemd service
	install -Dm644 "factorio-init.service" "$pkgdir/usr/lib/systemd/system/factorio-init.service"

	# Install license
	install -Dm644 "$_upstream/LICENSE" "$pkgdir/usr/share/licenses/factorio-init/LICENSE"
}
