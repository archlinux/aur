# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Maintainer: tacheometrist <aur@tacheometrist.dev>

pkgname=surrealist-bin
pkgver=3.3.3
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
sha256sums=('b9b0bcc8c5af865d3e46553a978d88003f4c59cba75c1f773fa372025b1997cf')

package() {
	bsdtar -O -xf "surrealist_${pkgver//_/-}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
	sed -i 's/Exec=surrealist/Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 surrealist --uri=%U/g' ${pkgdir}/usr/share/applications/Surrealist.desktop
	echo "Comment=Surrealist is the ultimate way to visually manage your SurrealDB database" >> ${pkgdir}/usr/share/applications/Surrealist.desktop
}
