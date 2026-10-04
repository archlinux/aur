# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-fastdiract-git
_pkgname=fastdiract-git
pkgver=r9.f386e87
pkgrel=1
pkgdesc="Ultra-fast directory/action jumping for the shell, using fzf for context switching"
arch=('any')
url="https://github.com/dp12/fastdiract"
license=('MIT')
depends=('bash' 'fzf' 'python')
makedepends=('git')
provides=('fastdiract')
conflicts=('fastdiract')
source=("fastdiract::git+https://github.com/dp12/fastdiract.git")
sha256sums=('SKIP')

pkgver() {
	cd fastdiract
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd fastdiract
	install -d "$pkgdir/usr/share/$_pkgname"
	cp -r ./* "$pkgdir/usr/share/$_pkgname/"
	rm -f "$pkgdir/usr/share/$_pkgname/install.sh"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	cat >"$pkgdir/usr/share/doc/$_pkgname/USAGE.txt" <<'EOF'
Para activar fastdiract, añade a tu ~/.bashrc:
source /usr/share/fastdiract-git/definitions
fastactions/fastvim requieren Python; fzf es necesario para el cambio de
contextos. Si vienes de una versión antigua, ejecuta migrate.sh desde
/usr/share/fastdiract-git/. Consulta README.md para personalización.
EOF

	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	fi
}
