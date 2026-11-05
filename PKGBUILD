# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=fzlaunch-git
pkgver=r2.1100868
pkgrel=1
pkgdesc='Launch apps and commands as systemd units from fzf (git development version)'
arch=(any)
url='https://gitlab.com/greyxor/fzlaunch'
license=(MIT)
depends=(
	awk
	coreutils
	findutils
	'fzf>=0.61'
	sed
	sh
)
makedepends=(git)
optdepends=(
	'app2unit: launch picks as systemd units (default launcher)'
	'uwsm: launch picks with FZLAUNCH_LAUNCHER="uwsm app" or "uwsm-app"'
	'xdg-terminal-exec: open commands and terminal apps in your terminal'
	'man-db: command summaries in the preview'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
	sh "${pkgname}/tests/run.sh"
}

package() {
	cd "${pkgname}"
	install -Dm755 fzlaunch -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
