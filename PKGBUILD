# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=kde-builder
pkgname="${_pkgname}-git"
pkgver=r467.0fbeb97
pkgrel=1
pkgdesc="A tool to build KDE software"
url="https://kde-builder.kde.org/en/introduction/brief-intro.html"
arch=("any")
license=("GPL")
depends=("git" "dbus-python" "python-yaml" "python-setproctitle")
makedepends=()
provides=(kde-builder)
conflicts=(kde-builder)
optdepends=(
	'python-pytest: testing support'
)
source=("git+https://invent.kde.org/sdk/${_pkgname}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -dm644 "${pkgdir}/usr/share"
	cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}"
	install -dm644 "${pkgdir}/usr/bin"
	ln -sf "/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -dm644 "${pkgdir}/usr/share/zsh/site-functions"
	ln -sf "/usr/share/${_pkgname}/data/completions/zsh/_kde-builder" "${pkgdir}/usr/share/zsh/site-functions/_kde-builder"
	ln -sf "/usr/share/${_pkgname}/data/completions/zsh/_kde-builder_projects_and_groups" "${pkgdir}/usr/share/zsh/site-functions/_kde-builder_projects_and_groups"
}
