# Maintainer: Hans Müller <schreibemirhalt@gmail.com>
pkgname=discord-gdpr-privacy-request
pkgver=1.0.0
pkgrel=1
pkgdesc="A script to send GDPR privacy requests to Discord using tokens from a config file. ✨ Help them to get work. ✨"
arch=('any')
url="https://aur.archlinux.org/packages/$pkgname/"
license=('AGPLv3')
depends=('curl' 'awk' 'libnotify')
source=(
	"$pkgname.sh"
	"$pkgname.service"
	"$pkgname.timer"
)
md5sums=(
	'72ce1f29d15e74788c4e60315507d5f2'
	'5e300fc0a007eefac46d49a2d553a68a'
	'538197d1157af378d4adb101eb798069'
)

package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname.service" "$pkgdir/etc/systemd/user/$pkgname.service"
    install -Dm644 "$pkgname.timer" "$pkgdir/etc/systemd/user/$pkgname.timer"
    
    printf "\033[0;35m Thanks for installing this package. Further manual setup steps: \n"
    printf "\033[0;35m nano .config/discord-gdpr-privacy-request (one token per line) \n"
    printf "\033[0;35m systemctl --user enable %s.timer\n" "$pkgname"
    printf "\033[0;35m systemctl --user start %s.timer\n" "$pkgname"
}
