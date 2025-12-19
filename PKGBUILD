# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Maintainer: tacheometrist <aur@tacheometrist.dev>

pkgname=surrealist-bin
pkgver=3.6.13
pkgrel=1
pkgdesc="Surrealist is the ultimate way to visually manage your SurrealDB database"
arch=("x86_64")
url="https://github.com/surrealdb/surrealist"
license=("MIT")
groups=()
depends=("webkit2gtk-4.1" "gtk3")
provides=("surrealist")
conflicts=("surrealist")
_debname="Surrealist_${pkgver//_/-}_amd64.deb"
source=("https://github.com/surrealdb/surrealist/releases/download/surrealist-v${pkgver//_/-}/${_debname}")
sha256sums=('8806757fc11655198f7e52f89174cde3c889c659cdaadb3c640d5c05aca817d6')

package() {
	bsdtar -O -xf "${_debname}" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
	sed -i 's/Exec=surrealist/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 surrealist --uri=%U/g' ${pkgdir}/usr/share/applications/Surrealist.desktop
	echo "Comment=Surrealist is the ultimate way to visually manage your SurrealDB database" >> ${pkgdir}/usr/share/applications/Surrealist.desktop
}
