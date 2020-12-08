#maintainer lxgr <lxgr@protonmail.com>
pkgname=buildaur
pkgver=42.0.8.3
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
md5sums=('14fa9f1b08110cff4948a55c60c20680')
_python_version=$(python -c "import sys; print(sys.version[:3])")

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -dm755 "${pkgdir}/usr/share/buildaur"
	install -dm755 "${pkgdir}/usr/lib/python${_python_version}/site-packages"
	install -dm755 "${pkgdir}/etc/bash_completion.d"
	install -m644 blacklist "${pkgdir}/usr/share/buildaur"
	install -m644 buildaur-completion.bash "${pkgdir}/etc/bash_completion.d"
	install -Dm0755 progressbar_buildaur.py "${pkgdir}/usr/lib/python${_python_version}/site-packages"
	install -Dm0755 buildaur_translations.py "${pkgdir}/usr/lib/python${_python_version}/site-packages"
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
