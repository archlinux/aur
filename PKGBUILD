# Maintainer: agilob <archlinux@agilob.net>
_pkgname=jmc-adoptium
pkgname="${_pkgname}"
pkgver=9.0.0_SNAPSHOT
pkg_ver=9.0.0-SNAPSHOT
pkgrel=10
pkgdesc='Java Mission Control from Adoptium'
arch=('x86_64')
url='https://github.com/adoptium/jmc-build'
# license=('MIT')
provides=("$pkgname")
options=(!strip)
noextract=()
source=("org.openjdk.jmc-${pkg_ver}-linux-${pkgrel}.gtk.x86_64.tar.gz::https://github.com/adoptium/jmc-build/releases/download/${pkg_ver}/org.openjdk.jmc-${pkg_ver}-linux.gtk.x86_64.tar.gz")
sha512sums=('fecbf32428b4a67225f799598ce1bbad67be5b12d29d5417a28a1c825417fba0de3997018d01cf6b6ffe50b1a879394b015e5c519b5a55dd61b9a78ae24845f7')

prepare() {
    tar -zxf "org.openjdk.jmc-${pkg_ver}-linux-${pkgrel}.gtk.x86_64.tar.gz"
}

build() {
cat > "jmc.desktop" <<EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Name=JMC Java Mission Control
Exec=/opt/jmc-adoptium/jmc
Terminal=false
Type=Application
Icon=/opt/jmc-adoptium/icon.xpm
StartupWMClass=JMC
X-AppImage-Version=current
Comment=Java Mission Conrol by Adoptium
Categories=Development;
EOF
}

package() {
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/share/applications"
    mv "JDK Mission Control/" "$pkgdir/opt/" # move whole package to opt/JDK Mission Control/
    mv "$pkgdir/opt/JDK Mission Control/" "$pkgdir/opt/${_pkgname}/" #rename directory to top/jmc-adoptium

    mv "jmc.desktop" "$pkgdir/usr/share/applications"

    install -dm755 "$pkgdir/opt/${_pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    ln -s "/opt/${_pkgname}/jmc" "${pkgdir}/usr/bin/jmc"

}
