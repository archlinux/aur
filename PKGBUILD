pkgname=spackit
pkgver=1.1
pkgrel=1
pkgdesc="Kit de herramientas y alias personalizados"
arch=('any')
url="https://github.com/Jeicobroot-jrt/Spackit"
license=('MIT')
depends=('python' 'bash' 'git')
source=("git+${url}.git"
        "setup_aliases.sh")
sha256sums=('SKIP'
            '0db91cbd7396a71578f8b170b1d74713ab7a01eb7cdf605ac1cd4ff0ab0ca20d')

package() {
    # 1. Creamos la carpeta de la app
    install -d "${pkgdir}/usr/share/${pkgname}"
    
    # 2. Copiamos el contenido que se descargó de GitHub
    # Nota: makepkg descarga el repo en una carpeta llamada 'Spackit' (o similar)
    cp -r "${srcdir}/Spackit/"* "${pkgdir}/usr/share/${pkgname}/"

    # 3. Creamos un binario "lanzador" simple en /usr/bin
    # Este script solo dirá: "Ejecuta el main.py que está en /usr/share/spackit"
    install -d "${pkgdir}/usr/bin"
    echo -e "#!/bin/bash\npython /usr/share/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"

    # 4. Instalamos los alias automáticos
    install -Dm644 "${srcdir}/setup_aliases.sh" "${pkgdir}/etc/profile.d/spackit.sh"
}
