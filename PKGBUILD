# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

pkgname=gitlab-workhorse
pkgver=0.6.5
pkgrel=2
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
sha512sums=('582b06a009cc108c9a3e39c05847e4bcd592824b6b7d8d8ef1cf47a5dda7b094ead1779cb7cfcac962eb41e027225e7202048d29e19e5591e8f000defafa3ddf'
            'd108e04eb118b27a201b4d73943e3f91a5d3df82afa7e599e8377a138f26b4911b5dccc81431afe9a04340889e059a582216c55af18b365a299e72d39fdb91b4')

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
