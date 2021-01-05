#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur-git
_pkgname=buildaur
pkgver=195.b8bbadc
pkgrel=2
pkgdesc="An AUR helper with asp support (development version)"
arch=(any)
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL3')
depends=('pacman' 'devtools' 'git' 'python3' 'python-requests' 'pyalpm')
makedepends=('git')
backup=('etc/buildaur/buildaur.conf')
optdepends=("bash-completion: Bash completion" "asp: ASP support")
source=("$pkgname"::'git+https://github.com/lxgr-linux/buildaur.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/$pkgname"
  install -Dm0755 -t "${pkgdir}/usr/bin" buildaur.sh buildaur
	install -Dm644 -t "${pkgdir}/usr/share/buildaur" progressbar_buildaur.py buildaur_translations.py outputter.sh
  install -Dm0755 -t "${pkgdir}/usr/share/buildaur" outputter.sh
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
	install -Dm644 -t "${pkgdir}/etc/bash_completion.d/" buildaur-completion.bash
	install -Dm644 -t "$pkgdir/etc/buildaur/" buildaur.conf
	install -dm755 "${pkgdir}/etc/buildaur/"{prehooks,posthooks,prerunhooks,postrunhooks,hooks}
	install -Dm0755 ./prehooks/* "$pkgdir/etc/buildaur/prehooks"
	#install -Dm0755 -t "$pkgdir/etc/buildaur/posthooks" ./posthooks/*
}
