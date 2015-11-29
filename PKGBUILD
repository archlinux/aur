# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

pkgname=gitlab-workhorse
pkgver=0.4.2
pkgrel=1
pkgdesc="HTTP server to unload Git HTTP traffic from GitLab Rails app (Unicorn)"
arch=('i686' 'x86_64')
url="https://gitlab.com/gitlab-org/gitlab-workhorse"
license=('MIT')
conflicts=('gitlab-git-http-server')
replaces=('gitlab-git-http-server')
makedepends=('go')
source=("${pkgname}-${pkgver}.tgz::https://gitlab.com/gitlab-org/gitlab-workhorse/repository/archive.tar.gz?ref=${pkgver}")
sha512sums=('41ed8fb2b8e8a0a6584662a4b808e9e7f0380d8a736c340d813e61f220dffdbd141da6ff3b7465057b00df46a952110c6f3185937fd7bc7f169ccbb5bb882726')


prepare() {
	ln -sf $(ls ${srcdir} | grep ${pkgname}-${pkgver}-* | grep -v .tgz) ${pkgname}-${pkgver}
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/gitlab-workhorse" "${pkgdir}/usr/bin/gitlab-workhorse"
}

# vim:set ts=4 sw=4 et:
