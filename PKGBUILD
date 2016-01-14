# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

pkgname=gitlab-workhorse
pkgver=0.5.4
pkgrel=1
pkgdesc="HTTP server to unload Git HTTP traffic from GitLab Rails app (Unicorn)"
arch=('i686' 'x86_64')
url="https://gitlab.com/gitlab-org/gitlab-workhorse"
license=('MIT')
conflicts=('gitlab-git-http-server')
replaces=('gitlab-git-http-server')
makedepends=('gcc-go')
source=("${pkgname}-${pkgver}.tgz::https://gitlab.com/gitlab-org/gitlab-workhorse/repository/archive.tar.gz?ref=${pkgver}"
	gitlab-workhorse.service
	)
sha512sums=('10bc8cfd0d33a08c0a0279f0ce5c0e64e5ac7f1bb1cb2b7436c6ed00240f922fb8c0d1195e3e2ff1b77a4e569acce42747b307d20cfaf754c169b1c4258e15b0'
	'cbcdca5f9c33f59361407b2d5cc3d1e6d2ac4785bcd0ebb6232628b88b3a3b99d38a0dbacfcefcae76b97d3a13f0e4b7a027d1caff8fcd236ac5b5c2ca63c1e7'
	)


prepare() {
	ln -sf $(ls ${srcdir} | grep ${pkgname}-${pkgver}-* | grep -v .tgz) ${pkgname}-${pkgver}
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/gitlab-workhorse" "${pkgdir}/usr/bin/gitlab-workhorse"
	install -Dm0644 "${srcdir}/gitlab-workhorse.service" "${pkgdir}/usr/lib/systemd/system/gitlab-workhorse.service"
}

# vim:set ts=4 sw=4 et:
