# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitlab-git-http-server
pkgver=0.2.10
pkgrel=3
pkgdesc="HTTP server to unload Git HTTP traffic from GitLab Rails app (Unicorn)"
arch=('i686' 'x86_64')
url="https://gitlab.com/gitlab-org/gitlab-git-http-server"
license=('MIT')
depends=('gitlab')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/gitlab-org/gitlab-git-http-server/repository/archive.tar.gz?ref=${pkgver}"
        "gitlab-git-http.service")
sha256sums=('4351b22bb3e336233cfd882ff032c3830576090a18522b30b340295dae14e2d3'
            'd7232e76c3f2b565b75b3b5ab027a3f9fa58c992f4b7e2c7efe4f02697b369d1')

prepare() {
    extract_loc=$(find ./ -maxdepth 1 -type d -name "${pkgname}-${pkgver}-*" )
    [[ -h "${pkgname}-${pkgver}" ]] || ln -s "$extract_loc" "${pkgname}-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    make gitlab-git-http-server
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/gitlab-git-http-server" "${pkgdir}/usr/bin/gitlab-git-http-server"
    install -Dm0644 gitlab-git-http.service "${pkgdir}/usr/lib/systemd/system/gitlab-git-http.service"
}
