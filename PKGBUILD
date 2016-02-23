# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

pkgname=gitlab-workhorse
pkgver=0.6.5
pkgrel=3
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
            'e2fb1bb1c0b3f0ee2a251ab99599718d63a5b8e0c2822f16505360968fc32d6b71f924b937605364830385b8d56a4d51f61ad36dc9dc6e094e88b0c52955919e')

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
