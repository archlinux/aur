# Maintainer: Oscar Rodriguez a.k.a mester <mester@disroot.org> 
pkgname="arashi-icon-theme"
pkgver=25.08.3
pkgrel=1
arch=("any")
license=('CC-BY-4.0')
pkgdesc="Arashi a smooth, modern icon set with a twist!"
url="https://github.com/0hStormy/Arashi"
provides=("arashi-icon-theme")
depends=('hicolor-icon-theme')
options=('!strip')

source=(Arashi-$pkgver::"$url/releases/download/$pkgver/Arashi-$pkgver.zip")

sha256sums=("efa7e4c94a05cd5103dab814c157c4514adaebd7bda36c77a239489b3d00a3ea")

package() {
	cd "${srcdir}/Arashi"
	rm -rf .github
	rm -rf .git
	for dir in */; do
        # Excluye la carpeta 128x128 para no crear enlaces en ella misma.
        if [ "$dir" != "128x128/" ]; then
            # Entra en el directorio de destino
            (
                cd "$dir"
                # Crea los enlaces: los archivos de origen son ../128x128/*
                # y el destino es el directorio actual (.).
                ln -s ../128x128/* . 2>/dev/null
            )
        fi
    done
	install -d -m755 "${pkgdir}/usr/share/icons/Arashi"
	cp -a --no-preserve=ownership . "${pkgdir}/usr/share/icons/Arashi"
}
