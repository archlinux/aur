pkgname=pgadmin4-bin
pkgver=9.11
pkgrel=1
pkgdesc='Installs all required components to run pgAdmin in desktop and web modes. pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, the most advanced Open Source database in the world.'
arch=('x86_64')
url='https://www.pgadmin.org'
license=('PostgreSQL')
depends=('postgresql-libs' 'krb5' 'python-dbus')
conflicts=('pgadmin4' 'pgadmin4-server' 'pgadmin4-desktop' 'pgadmin4-web')
provides=('pgadmin4')
source=("pgadmin4-server-${pkgver}-x86_64.pkg.tar.zst::https://github.com/lzx3in/aur-pgadmin4/releases/download/dev/pgadmin4-server-${pkgver}-x86_64.pkg.tar.zst"
     "pgadmin4-desktop-${pkgver}-x86_64.pkg.tar.zst::https://github.com/lzx3in/aur-pgadmin4/releases/download/dev/pgadmin4-desktop-${pkgver}-x86_64.pkg.tar.zst"
     "pgadmin4-web-${pkgver}-x86_64.pkg.tar.zst::https://github.com/lzx3in/aur-pgadmin4/releases/download/dev/pgadmin4-web-${pkgver}-x86_64.pkg.tar.zst"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # Merge all components into package directory
    bsdtar -xvf "${srcdir}/pgadmin4-server-${pkgver}-x86_64.pkg.tar.zst" -C "${pkgdir}"
    bsdtar -xvf "${srcdir}/pgadmin4-desktop-${pkgver}-x86_64.pkg.tar.zst" -C "${pkgdir}"
    bsdtar -xvf "${srcdir}/pgadmin4-web-${pkgver}-x86_64.pkg.tar.zst" -C "${pkgdir}"

    # Install license
    install -Dm644 "${pkgdir}/usr/pgadmin4/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
