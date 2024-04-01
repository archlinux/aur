# Maintainer  : SysAdm <sysadm [dot] archlinux [at] proton [dot] me>
# Contributor : Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego

pkgver=4.6.0
pkgrel=1

pkgdesc='An open source intelligence and forensics application'
url="https://www.$pkgname.com"
arch=('any')
license=('custom')

depends=('java-environment=17')

install="$pkgname.install"
source=("https://downloads.maltego.com/maltego-v4/linux/Maltego.v$pkgver.linux.zip"
        "LICENSE.pdf::https://www.maltego.com/pdf/legal/2022-09_Maltego%20Technologies_TermsandConditions.pdf")
sha256sums=('5eb8f4a516897ef3ac42116f83c7740aa4f3723e055532e0524dffb5eeceb0f8'
            'b06d49dae3ded95e2c01b4ec26210492add658ee02c32d4950985276e5f5fffa')

options=('!emptydirs')

package() {
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/opt/$pkgname"
  install -dm 755 "$pkgdir/usr/share/applications"

  find "$pkgdir" -type f -regex '.*\.\(exe\|dll\)$' -delete

  cp -aR "${pkgname}_${pkgver}"/* "$pkgdir/opt/$pkgname/"
  ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 LICENSE.pdf -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 "${pkgname}_${pkgver}/bin/maltego.ico" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"

  desktop_file="$pkgdir/usr/share/applications/maltego.desktop"
  echo "[Desktop Entry]" > "$desktop_file"
  echo "Name=Maltego" >> "$desktop_file"
  echo "GenericName=Open Source Intelligence and Forensics" >> "$desktop_file"
  echo "Exec=/usr/bin/$pkgname" >> "$desktop_file"
  echo "Type=Application" >> "$desktop_file"
  echo "Categories=Network;Security;Forensics;" >> "$desktop_file"
}
