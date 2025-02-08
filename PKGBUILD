# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=nodemcu-pyflasher
pkgver=5.1.0
pkgrel=1
pkgdesc="Self-contained NodeMCU flasher with GUI based on esptool.py and wxPython."
arch=("any")
url="https://github.com/marcelstoer/nodemcu-pyflasher"
depends=(
	'python-pyserial'
	'python-wxpython'
	'esptool'
	'python-httplib2')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marcelstoer/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('65ff95a3bfa32857f36475c03aa9af256ec7ea2e2ece91b4d97e48b9e014a74c')

package() {
  cd "$pkgname-$pkgver"
  
  # script
  install -Dm644 About.py -t ${pkgdir}/usr/share/${pkgname}
  install -Dm644 HtmlPopupTransientWindow.py -t ${pkgdir}/usr/share/${pkgname}
  install -Dm644 Main.py -t ${pkgdir}/usr/share/${pkgname}
  install -Dm644 images.py -t ${pkgdir}/usr/share/${pkgname}
  install -Dm755 ${pkgname}.py -t ${pkgdir}/usr/share/${pkgname}

  # soft link
  install -dm755 ${pkgdir}/usr/bin/
  ln -sf /usr/share/${pkgname}/${pkgname}.py ${pkgdir}/usr/bin/${pkgname}

  # images
  find images -type f -exec install -Dm644 {} ${pkgdir}/usr/share/${pkgname}/{} \;

  # icon
  install -Dm644 images/icon-64.png  ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  
  # LICENSE
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
  
  # desktop entry
  install -dm755 ${pkgdir}/usr/share/applications 
  cat > ${pkgdir}/usr/share/applications/${pkgname}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=${pkgname}
Comment=ModeMCU Flash Tool
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
EOF
}

# vim: sw=2 ts=2 et:
