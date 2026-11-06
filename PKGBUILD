# Maintainer: GreyXor <greyxor@protonmail.com>
pkgname=fzlaunch-git
pkgver=r8.a17e128
pkgrel=1
pkgdesc='Launch apps and commands as systemd units from fzf (git development version)'
arch=(any)
url='https://gitlab.com/greyxor/fzlaunch'
license=('AGPL-3.0-only')
# Everything fzlaunch runs itself. app2unit is the default launcher (uwsm can
# replace it, see optdepends) and needs xdg-terminal-exec for -T, which
# fzlaunch passes for every command, but does not depend on it.
depends=(
	app2unit
	awk
	coreutils
	findutils
	'fzf>=0.67'
	sed
	sh
	xdg-terminal-exec
)
makedepends=(git)
optdepends=(
	'chafa: app icons in the preview'
	'man-db: command summaries in the preview'
	'uwsm: launch with FZLAUNCH_LAUNCHER="uwsm app" or "uwsm-app"'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
	cd "${pkgname%-git}"
	sh tests/run.sh
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 fzlaunch -t "${pkgdir}/usr/bin/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
