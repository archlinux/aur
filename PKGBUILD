#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur-git
_pkgname=buildaur
pkgver=188.064da14
pkgrel=1
pkgdesc="An AUR helper with asp support (development version)"
arch=(any)
conflicts=($_pkgname)
provides=($_pkgname)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL3')
depends=('pacman' 'devtools' 'git' 'python3' 'python-requests' 'pyalpm')
makedepends=('git')
backup=('etc/buildaur/buildaur.conf' 'usr/share/buildaur/blacklist')
optdepends=("bash-completion: Bash completion" "asp: ASP support")
source=("$pkgname"::'git+https://github.com/lxgr-linux/buildaur.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/$pkgname"
	install -dm755 "${pkgdir}/usr/share/buildaur"
	install -dm755 "${pkgdir}/etc/bash_completion.d"
	install -m644 blacklist "${pkgdir}/usr/share/buildaur"
	install -m644 buildaur-completion.bash "${pkgdir}/etc/bash_completion.d"
	install -Dm0755 progressbar_buildaur.py "${pkgdir}/usr/share/buildaur"
	install -Dm0755 buildaur_translations.py "${pkgdir}/usr/share/buildaur"
	install -dm755 "${pkgdir}/etc/buildaur"
	install -dm755 "${pkgdir}/etc/buildaur/prehooks"
	install -dm755 "${pkgdir}/etc/buildaur/posthooks"
	install -dm755 "${pkgdir}/etc/buildaur/prerunhooks"
	install -dm755 "${pkgdir}/etc/buildaur/postrunhooks"
	install -dm755 "${pkgdir}/etc/buildaur/hooks"
	install -Dm0755 -t "$pkgdir/etc/buildaur/prehooks" ./prehooks/*
	install -m644 buildaur.conf "$pkgdir/etc/buildaur/"
	#install -Dm0755 -t "$pkgdir/etc/buildaur/posthooks" ./posthooks/*
	install -Dm0755 -t "$pkgdir/usr/bin" "buildaur"
	install -Dm0755 -t "$pkgdir/usr/bin" "buildaur.sh"
	install -Dm0755 -t "$pkgdir/usr/share/buildaur" "outputter.sh"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
