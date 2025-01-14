# Maintainer  : SysAdm <sysadm.archlinux@proton.me>
# Contributor : Stephen Argent <steve@tuxcon.com>

pkgname=maltego

pkgver=4.8.1
pkgrel=1

pkgdesc='An open source intelligence and forensics application'
url="https://www.$pkgname.com"
arch=('any')
license=('custom')

depends=('java-environment=17')

install="$pkgname.install"
source=("https://downloads.maltego.com/maltego-v4/linux/Maltego.v$pkgver.linux.zip"
        "LICENSE.pdf"
	"maltego.png")
sha256sums=('875a7ee49dea17f1e144eee831cf107ffa532f45946b251b749ea3981357ccf2'
            'b06d49dae3ded95e2c01b4ec26210492add658ee02c32d4950985276e5f5fffa'
            'bb59ca792e86a544117d33a78024d30035650a39aa1f02e7c5aee6a57e239be5')

options=('!emptydirs')

package() {
  install -dm 755 "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/opt/$pkgname"
  install -dm 755 "$pkgdir/usr/share/applications"

  find "$pkgdir" -type f -regex '.*\.\(exe\|dll\)$' -delete

  cp -aR "${pkgname}_${pkgver}"/* "$pkgdir/opt/$pkgname/"
  ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm 644 LICENSE.pdf -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 maltego.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"

  desktop_file="$pkgdir/usr/share/applications/maltego.desktop"
  echo "[Desktop Entry]" > "$desktop_file"
  echo "Name=Maltego" >> "$desktop_file"
  echo "GenericName=Open Source Intelligence and Forensics" >> "$desktop_file"
  echo "Exec=/usr/bin/$pkgname" >> "$desktop_file"
  echo "Icon=maltego" >> "$desktop_file"
  echo "Type=Application" >> "$desktop_file"
  echo "Categories=Network;Security;Forensics;" >> "$desktop_file"
}
