# Maintainer: agilob <archlinux@agilob.net>
_pkgname=jmc-adoptium
pkgname="${_pkgname}"
pkgver=8.3.0
pkgrel=2
pkgdesc='Java Mission Control from Adoptium'
arch=('x86_64')
url='https://github.com/adoptium/jmc-build'
# license=('MIT')
provides=("$pkgname")
options=(!strip)
noextract=()
source=("https://github.com/adoptium/jmc-build/releases/download/${pkgver}/org.openjdk.jmc-${pkgver}-linux.gtk.x86_64.tar.gz")
sha512sums=('3af1a31dd2e916c57c300ec8ed5a91105cdec7eadd1ecee7c39f256f4ebb4f5e5aaa79e3d14d4da5994875551ba8968412a004ec9831b1b1d8c0aaac3bc30809')

prepare() {
    tar -zxf "org.openjdk.jmc-${pkgver}-linux.gtk.x86_64.tar.gz"
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
Comment=Java Mission Conrol
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
    install -dm700 "${pkgdir}/usr/share/applications"
    ln -s "/opt/${_pkgname}/jmc" "${pkgdir}/usr/bin/jmc"

}
