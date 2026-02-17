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
    # 1. Creamos la carpeta del programa en el sistema
    install -d "${pkgdir}/usr/share/spackit"

    # 2. Copiamos Todos tus archivos .py a esa carpeta
    cp -r "${srcdir}/Spackit/"* "${pkgdir}/usr/share/spackit/"

    # 3. Creamos el ejecutable en /usr/bin que lanza tu programa
    # Esto evita el error de "ModuleNotFoundError"
    install -d "${pkgdir}/usr/bin"
    echo -e "#!/bin/bash\npython /usr/share/spackit/main.py \"\$@\"" > "${pkgdir}/usr/bin/spackit"
    chmod +x "${pkgdir}/usr/bin/spackit"

    # 4. Instalamos los alias automáticos
    install -Dm644 "${srcdir}/setup_aliases.sh" "${pkgdir}/etc/profile.d/spackit.sh"
}
