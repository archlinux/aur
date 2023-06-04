# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=fleek-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='"Home as Code" for Humans'
arch=(x86_64)
url=https://github.com/ublue-os/fleek
license=(Apache)
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_Linux_x86_64.tar.gz")
b2sums=('2c998493cdd79ffeab32b2ebfe219d96d2b81e900290906f439a1e64d4012901eacb8cf1afd39f28d207aad01a240a325944e25933fd49714e7954970576ec37')

package() {
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/share/man"
	cp -a man/en/* "$pkgdir/usr/share/man"
	for langdir in $(find man -maxdepth 1 | grep -Ev '^man(/en)?$'); do
		cp -a "$langdir" "$pkgdir/usr/share/man"
	done
	install -Dm644 "completions/${pkgname%-bin}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
	install -Dm644 "completions/${pkgname%-bin}.zsh" "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
	install -Dm644 "completions/${pkgname%-bin}.fish" "$pkgdir/usr/share/fish/${pkgname%-bin}.fish"
}
