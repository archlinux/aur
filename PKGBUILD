# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Maintainer: tacheometrist <aur@tacheometrist.dev>

pkgname=surrealist-bin
pkgver=3.5.7
pkgrel=1
pkgdesc="Surrealist is the ultimate way to visually manage your SurrealDB database"
arch=("x86_64")
url="https://github.com/surrealdb/surrealist"
license=("MIT")
groups=()
depends=("webkit2gtk-4.1" "gtk3")
provides=("surrealist")
conflicts=("surrealist")
source=("https://github.com/surrealdb/surrealist/releases/download/surrealist-v${pkgver//_/-}/surrealist_${pkgver//_/-}_amd64.deb")
sha256sums=('f5517281460d74e9e84eab7b709d5e72ef4083677a5fe0bfac16d7535495e546')

package() {
	bsdtar -O -xf "surrealist_${pkgver//_/-}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
	sed -i 's/Exec=surrealist/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 surrealist --uri=%U/g' ${pkgdir}/usr/share/applications/Surrealist.desktop
	echo "Comment=Surrealist is the ultimate way to visually manage your SurrealDB database" >> ${pkgdir}/usr/share/applications/Surrealist.desktop
}
