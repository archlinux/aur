# Maintainer: SZanko, szanko at protonmail dot com

pkgname=mcrevproxy
pkgver=0.3.4
pkgrel=1
pkgdesc="A small and simple reverse proxy for minecraft written using the mcproto library "
arch=('any')
url="https://github.com/themayankjha/JAKYM"
license=('MIT')
makedepends=(
	'npm'
)
depends=(
	'nodejs'
)
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=("e4176d913b937029cbe1ac299813de2c48bebd07e5c4b70520387e57dbf99f0f")
backup=(
    "etc/${pkgname}.conf"
)


package() {
    cd "${srcdir}/package"
	npm audit fix
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
    install -Dm644 "../../${pkgname}.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 "../../${pkgname}.conf" -t "$pkgdir/etc"
}
