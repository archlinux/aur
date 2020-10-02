#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=42.0.7.1
pkgrel=1
pkgdesc="An AUR helper with asp support"
arch=(any)
url="https://github.com/lxgr-linux/buildaur"
license=('GPL3')
depends=('pacman' 'asp' 'devtools' 'git' 'python3' 'python-requests' 'pyalpm')
makedepends=()
backup=('etc/buildaur/buildaur.conf' 'usr/share/buildaur/blacklist')
optdepends=("bash-completion: Bash completion")
source=("${pkgname}.tar.gz"::"https://github.com/lxgr-linux/buildaur/archive/${pkgver}.tar.gz")
md5sums=('a13679a956710dff3939ffad8226ba52')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -dm755 "${pkgdir}/usr/share/buildaur"
	install -dm755 "${pkgdir}/usr/lib/python3.8"
	install -dm755 "${pkgdir}/etc/bash_completion.d"
	install -m644 blacklist "${pkgdir}/usr/share/buildaur"
	install -m644 buildaur-completion.bash "${pkgdir}/etc/bash_completion.d"
	install -Dm0755 progressbar_buildaur.py "${pkgdir}/usr/lib/python3.8"
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
	install -Dm0755 -t "$pkgdir/usr/bin" "buildaur.py"
	install -Dm0755 -t "$pkgdir/usr/share/buildaur" "outputter.sh"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
