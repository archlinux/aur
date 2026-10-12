# Maintainer: Nacho Telmo

pkgname=sinergia-webapp-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="Gestor gráfico para crear WebApps independientes en Linux"
arch=('any')
url="https://github.com/Nacho-Telmo/sinergia-webapp-manager"
license=('GPL3')
depends=('python' 'python-pyqt6' 'python-requests')
source=("https://raw.githubusercontent.com/Nacho-Telmo/sinergia-webapp-manager/main/sinergia-webapps/main.py"
        "sinergia-webapp-manager.desktop")
sha256sums=('4cfd504ead7ea773679c0f9bc9cde16a1e3491b98da69fabb21c77a7f10b3711'
            'c687611035b0405ac9cb0090752fdff4f25558640fc89506c808f6c51ba7d1b3')

package() {
    # Crear los directorios en el sistema (virtualmente durante el empaquetado)
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/sinergia-webapp-manager"
    install -d "$pkgdir/usr/share/applications"
    
    # Instalar el código Python
    install -m755 "$srcdir/main.py" "$pkgdir/usr/share/sinergia-webapp-manager/main.py"
    
    # Crear un binario ejecutable en /usr/bin que llame al script
    echo "#!/bin/bash" > "$pkgdir/usr/bin/sinergia-webapp-manager"
    echo "python /usr/share/sinergia-webapp-manager/main.py" >> "$pkgdir/usr/bin/sinergia-webapp-manager"
    chmod +x "$pkgdir/usr/bin/sinergia-webapp-manager"
    
    # Instalar el archivo .desktop para que aparezca en el menú
    install -m644 "$srcdir/sinergia-webapp-manager.desktop" "$pkgdir/usr/share/applications/sinergia-webapp-manager.desktop"
}
