# Maintainer: KlapkiSzatana
pkgname=budget-app-bin
_pkgname=budget-app
pkgver=1.3.6
pkgrel=1
pkgdesc="Zarządzanie Budżetem Domowym"
arch=('x86_64')
url="https://github.com/KlapkiSzatana/budget-app"
license=('GPL-3.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
options=('!strip' '!debug')

source=("https://github.com/KlapkiSzatana/budget-app/releases/download/v${pkgver}/BudgetApp_linux.tar.gz")
sha256sums=('a9dd61727a69f15c23e9555aee661d4c24c1a6fecc0dded8b8e1a4dbc4c9b9ec')

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
