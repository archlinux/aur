# Maintainer: KlapkiSzatana
pkgname=budget-app-bin
_pkgname=budget-app
pkgver=1.6.3
pkgrel=1
pkgdesc="Zarządzanie Budżetem Domowym (gotowa wersja binarna)"
arch=('x86_64')
url="https://github.com/KlapkiSzatana/budget-app"
license=('GPL-3.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source=("https://github.com/KlapkiSzatana/budget-app/releases/download/v${pkgver}/BudgetApp_linux.tar.gz")
sha256sums=('c013fcc1708dc37c54eb50930e23b4a0e9e64e5bef4d088920508ceb883532b7')

package() {
    cd "$srcdir/linux-package"

    install -d "${pkgdir}/opt/BudgetApp"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/applications"

    cp -r BudgetApp "${pkgdir}/opt/"
    cp budget.png "${pkgdir}/opt/BudgetApp/"

    chmod +x "${pkgdir}/opt/BudgetApp/BudgetApp"

    install -m644 budget.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    cat <<EOF > "${pkgdir}/usr/bin/${_pkgname}"
#!/bin/sh
exec /opt/BudgetApp/BudgetApp "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    cat <<EOF > "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Name=Home Budget
Name[pl]=Budżet Domowy
Comment=Home Budget Management
Comment[pl]=Zarządzanie Budżetem Domowym
Exec=/usr/bin/${_pkgname}
Icon=${_pkgname}
Terminal=false
Type=Application
Categories=Office;Finance;
StartupWMClass=BudgetApp
StartupNotify=false
EOF
    chmod 644 "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
