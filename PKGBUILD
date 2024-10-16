# Maintainer: tacheometrist <aur@tacheometrist.dev>

pkgname=surrealist-bin
pkgver=3.0.8
pkgrel=1
pkgdesc="Surrealist is the ultimate way to visually manage your SurrealDB database"
arch=("x86_64")
url="https://github.com/surrealdb/surrealist"
license=("MIT")
groups=()
depends=("webkit2gtk" "gtk3")
provides=("surrealist")
conflicts=("surrealist")
source=("https://github.com/surrealdb/surrealist/releases/download/surrealist-v${pkgver//_/-}/surrealist_${pkgver//_/-}_amd64.deb")
md5sums=("SKIP")

package() {
	bsdtar -O -xf "surrealist_${pkgver//_/-}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
	sed -i 's/Exec=surrealist/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 surrealist/g' ${pkgdir}/usr/share/applications/surrealist.desktop
	echo "Comment=Surrealist is the ultimate way to visually manage your SurrealDB database" >> ${pkgdir}/usr/share/applications/surrealist.desktop
}
