#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=42.0.8.7
pkgrel=2
pkgdesc="An AUR helper with asp support"
arch=(any)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL3')
depends=('pacman' 'devtools' 'git' 'python3' 'python-requests' 'pyalpm')
makedepends=()
backup=('etc/buildaur/buildaur.conf' 'usr/share/buildaur/blacklist')
optdepends=("bash-completion: Bash completion" "asp: ASP support")
source=("${pkgname}.tar.gz"::"https://github.com/lxgr-linux/buildaur/archive/${pkgver}.tar.gz")
md5sums=('2d6729a790ed96bfc07c011adeb356e8')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "${pkgdir}/usr/bin" buildaur.sh buildaur
	install -Dm644 -t "${pkgdir}/usr/share/buildaur" progressbar_buildaur.py buildaur_translations.py outputter.sh blacklist
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -Dm644 -t "${pkgdir}/etc/bash_completion.d/" buildaur-completion.bash
	install -Dm644 -t "$pkgdir/etc/buildaur/" buildaur.conf
	install -dm755 "${pkgdir}/etc/buildaur/"{prehooks,posthooks,prerunhooks,postrunhooks,hooks}
	install -Dm0755 ./prehooks/* "$pkgdir/etc/buildaur/prehooks"
	#install -Dm0755 -t "$pkgdir/etc/buildaur/posthooks" ./posthooks/*
}
