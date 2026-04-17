# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Maintainer: tacheometrist <aur@tacheometrist.dev>

pkgname=surrealist-bin
pkgver=3.8.3
pkgrel=1
pkgdesc="Surrealist is the ultimate way to visually manage your SurrealDB database"
arch=("x86_64")
url="https://github.com/surrealdb/surrealist"
license=("MIT")
groups=()
depends=("webkit2gtk-4.1" "gtk3")
provides=("surrealist")
conflicts=("surrealist" "surrealist-cef")
optdepends=('surrealdb: non-sandboxed SurrealDB instance')
_debname="Surrealist_${pkgver//_/-}_amd64.deb"
source=("https://github.com/surrealdb/surrealist/releases/download/surrealist-v${pkgver//_/-}/${_debname}")
sha256sums=('a575b55de7695ff5b6233da4d12d4bd570ea7026a2324e8a3a280e0db7f3be52')

package() {
	bsdtar -O -xf "${_debname}" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
	sed -i 's/Exec=surrealist/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 surrealist --uri=%U/g' ${pkgdir}/usr/share/applications/Surrealist.desktop
	echo "Comment=Surrealist is the ultimate way to visually manage your SurrealDB database" >> ${pkgdir}/usr/share/applications/Surrealist.desktop
}
