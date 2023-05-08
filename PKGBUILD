#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=42.1.1
pkgrel=2
pkgdesc="An AUR helper with asp support"
arch=(any)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL3')
depends=('pacman' 'devtools' 'git' 'python3' 'python-requests' 'pyalpm')
makedepends=('git')
backup=('etc/buildaur/buildaur.conf')
optdepends=("bash-completion: Bash completion" "asp: ASP support")
source=("${pkgname}.tar.gz"::"https://github.com/lxgr-linux/buildaur/archive/${pkgver}.tar.gz")
md5sums=('f5e1a2c752b20f8bba68283bd4fc359d')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "${pkgdir}/usr/bin" buildaur.sh buildaur
	install -Dm644 -t "${pkgdir}/usr/share/buildaur" progressbar_buildaur.py buildaur_translations.py
	install -Dm644 -t "${pkgdir}/usr/share/zsh/site-functions/" _buildaur
	install -Dm0755 -t "${pkgdir}/usr/share/buildaur" outputter.sh
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -Dm644 -t "${pkgdir}/etc/bash_completion.d/" buildaur-completion.bash
	install -Dm644 -t "$pkgdir/etc/buildaur/" buildaur.conf
	install -dm755 "${pkgdir}/etc/buildaur/"{prehooks,posthooks,prerunhooks,postrunhooks,hooks}
	install -Dm0755 ./prehooks/* "$pkgdir/etc/buildaur/prehooks"
	#install -Dm0755 -t "$pkgdir/etc/buildaur/posthooks" ./posthooks/*
}
