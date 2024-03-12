# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=dataexplorer
pkgver=3.8.5
pkgrel=1
pkgdesc="Graphical tool to analyze data, gathered from various hardware devices."
url="http://savannah.nongnu.org/projects/dataexplorer"
arch=("i686" "x86_64")
license=("GPL3")
install=$pkgname.install
makedepends=("apache-ant" "jdk17-openjdk")
depends=("jdk17-openjdk")
source=("http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz"
        "http://download.savannah.gnu.org/releases/dataexplorer/dataexplorer-$pkgver-src.tar.gz.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-FTDI.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-MosChip.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-ProfilicTechnology.rules.sig"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules"
        "http://download.savannah.gnu.org/releases/dataexplorer/udev_rules/40-SiliconLabs.rules.sig"
        "dataexplorer.sh"
        "deviceproperties-editor.sh"
        )
noextract=("dataexplorer-$pkgver-src.tar.gz.sig"
           "40-FTDI.rules"
           "40-FTDI.rules.sig"
           "40-MosChip.rules"
           "40-MosChip.rules.sig"
           "40-ProfilicTechnology.rules"
           "40-ProfilicTechnology.rules.sig"
           "40-SiliconLabs.rules"
           "40-SiliconLabs.rules.sig")
sha512sums=("d589d0ff2ddcea4548dfa0327180bf31c12a2a006ddaab4a3b9a01e91f6951eaf7df92811bf1f2f676f78bb9b063b0ef9b26f30dd3a77d024c8cd887c6272506"
	    "20a57e8fd54a565fe46ec7811635c153ea3b97cccd605f1e56a05dc837fc3d81a5b117e18096de197d22a231d77a3b5ae6092bf7a7811eed9ad29554a8b8aef6"
            "adc0d042c68970d21c3e44faa29015e6d916a14587ea73c2273e7b15351d161d4d54ccc94293a67e53d63d97a70e0dbee6a2b5af30e6e1f8df6f12cb27516036"
            "e23a8c063991012e55e81a1331340a1003c177b128fa175840a340f9da1782161d22c655563168bf8381b7fa1271567ad7ad1514d8fa5f06d1540561a06a452c"
            "8bb9d77e86e47a5a42bfdf661ea35a4543b3a22336ae4f718657e12089091cf1d6664fd1090e194da4c56f34c5febef960f50692246a1109ded19921854b9e5f"
            "ae547fc0bec4855e2ebf0aa6eaa540206e2fd527785c66c9729da47202a5d354ab5eaad5855a66ecbc22b0f541fa79e56225c154c9905c6d8cda72cee54300cb"
            "3174d20d0de4b8cf0756b1fe69563ca4c3133b108bdda2bd90a8b0163d3f35c826c1356544735181023f2cbaee71a3a7224f88221ad57fa187a52c4d04fe023a"
            "d3fc195886e0b97de3d26b3a39dec7455a54e16981251f43b5efe9a15f74b53d9538b330796afe525e381e6adcdfb81eb034f09e9aba89150226bbb1fe22b8ea"
            "8d969524ae67b5170976efd408ab4c28b23d8a33bc0d671d1b968a6cab4ebfbc80067561f1837470c8cd92e711df136851fec85e683ddf7fd1a33f93b6e39210"
            "fc990089b0317f0a0c69336fb4b3713d1e660c3db3a3b17117d40494bcd3b77294958dc3adcddce5529430129cfcb25c414e6f529d72b3491604921b5d4328dd"
            "274c77d924c7deb6ec5f5526a71b51e814d0b055348cf575b1803a5b3b53985273a510e37efcde0cf9a134253d2726eec243bcfbaab2ebdca22c51f4e3e68055"
            "11d632807f02ef4bcc5ffb4898ee6667920124049ef96d10df331c77f91de09f513e3e111744661b5eae0c23a2596f1a964c220341a6d47b8604de51ab5c1413")

validpgpkeys=("3F0CC709ECF91C5CC0BE9E601D295C19C9C06AF6") # Winfried Bruegmann

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ ! -e "RXTXcomm" ]; then
    ln -s "thirdparty/rxtx-2.2pre2" "RXTXcomm"
  fi

  ./configure --prefix=$pkgdir/opt
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir "$pkgdir/opt"
  make install

  install -Dm755 "$srcdir/dataexplorer.sh" "$pkgdir/usr/bin/dataexplorer"
  install -Dm755 "$srcdir/deviceproperties-editor.sh" "$pkgdir/usr/bin/deviceproperties-editor"

  install -Dm644 "$srcdir/40-FTDI.rules" "$pkgdir/etc/udev/rules.d/40-FTDI.rules"
  install -Dm644 "$srcdir/40-MosChip.rules" "$pkgdir/etc/udev/rules.d/40-MosChip.rules"
  install -Dm644 "$srcdir/40-ProfilicTechnology.rules" "$pkgdir/etc/udev/rules.d/40-ProfilicTechnology.rules"
  install -Dm644 "$srcdir/40-SiliconLabs.rules" "$pkgdir/etc/udev/rules.d/40-SiliconLabs.rules"

  install -Dm644 "$pkgdir/opt/DataExplorer/DataExplorer.desktop" "$pkgdir/usr/share/applications/DataExplorer.desktop"
  install -Dm644 "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.desktop" "$pkgdir/usr/share/applications/DevicePropertiesEditor.desktop"
  install -Dm644 "$pkgdir/opt/DataExplorer/DataExplorer.xpm" "$pkgdir/usr/share/pixmaps/DataExplorer.xpm"
  install -Dm644 "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.xpm" "$pkgdir/usr/share/pixmaps/DevicePropertiesEditor.xpm"
  rm "$pkgdir/opt/DataExplorer/DataExplorer.desktop"
  rm "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.desktop"
  rm "$pkgdir/opt/DataExplorer/DataExplorer.xpm"
  rm "$pkgdir/opt/DataExplorer/DevicePropertiesEditor.xpm"

  chmod +x "$pkgdir/opt/DataExplorer/DataExplorer"
  chmod +x "$pkgdir/opt/DataExplorer/DevicePropertiesEditor"
}

