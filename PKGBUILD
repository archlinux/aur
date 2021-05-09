# Maintainer: Stanislav Nikitin <pztrn at pztrn dot name>

pkgname=('alfis')
pkgver=0.5.2
pkgrel=1
pkgdesc='Alternative Free Identity System using blockchain'
arch=('x86_64')
url='https://github.com/Revertron/Alfis'
license=('AGPL3')
depends=('webkit2gtk' 'gtk3')
makedepends=('cargo' 'rust' 'atk' 'pango')
source=("https://github.com/Revertron/Alfis/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('99edb083fc7729f8f174aac84e8ec3a4f6918a5c8dfb6ea36a1448622459cb1e')

_dirname="Alfis-${pkgver}"

build() {
    cd ${_dirname}
    cargo build --release --all-features
}

package() {
    cd ${_dirname}
    cargo install --locked --root "${pkgdir}"/usr --path "${srcdir}"/${_dirname} --all-features
    rm "${pkgdir}"/usr/{.crates.toml,.crates2.json}

    install -Dm644 "${srcdir}"/${_dirname}/contrib/systemd/alfis.service "${pkgdir}"/usr/lib/systemd/system/alfis.service
    install -Dm644 "${srcdir}"/${_dirname}/contrib/systemd/alfis.sysusers "${pkgdir}"/usr/lib/sysusers.d/alfis.conf
    install -Dm644 "${srcdir}"/${_dirname}/contrib/systemd/alfis.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/alfis.conf
    install -Dm644 "${srcdir}"/${_dirname}/contrib/org.alfis.Alfis.desktop "${pkgdir}"/usr/share/applications/org.alfis.Alfis.desktop
}
